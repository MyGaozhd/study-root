package com.study.sys.circuitbreaker;

import java.util.function.Supplier;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.github.resilience4j.circuitbreaker.CircuitBreaker;
import io.github.resilience4j.circuitbreaker.CircuitBreaker.State;
import io.github.resilience4j.ratelimiter.RateLimiter;
import io.github.resilience4j.retry.Retry;
import io.vavr.CheckedFunction0;
import io.vavr.control.Try;

/**
 * CircuitBreakerFactory
 * @author liyang
 * @date 2018年12月28日 下午3:30:49
 */
public class CircuitBreakerFactory {
	
    private static final Logger logger = LoggerFactory.getLogger(CircuitBreakerFactory.class);
    
    /**
     * 断路器
     */
    private CircuitBreaker circuitBreaker;
    
    /**
     * 重发器
     */
    private Retry retry;

    /**
     * 限流器
     */
    private RateLimiter rateLimiter;
    
    public CircuitBreakerFactory(String breakerName){
    	this.circuitBreaker = CircuitBreaker.of(breakerName,CircuitBreakerConf.getCircuitBreakerConfig());
    	this.retry = Retry.of(breakerName, CircuitBreakerConf.getRetryConfig());
    	this.rateLimiter = RateLimiter.of(breakerName, CircuitBreakerConf.getRateLimiterConfig());
    }
    
    /**
     * 执行参数funcion的lambda表达式结果，如果执行出现异常，或者熔断器开启，则返回 参数fallback的lambda表达式结果
     * @param funcion
     * @param fallback
     * @return
     */
    public <T> T exec(CheckedFunction0<T> funcion, Supplier<T> fallback){
    	
    	//打印所有拦截器的状态
//   	    CircuitBreakerUtil.printCircuitBreakerStatus(circuitBreaker);
   	    //如果断路器已经开启，则直接降级
    	if(circuitBreaker.getState().equals(State.OPEN)){
             logger.info("降级啦 CCC......");
    		 return fallback.get();
    	}else{
    		//先执行限流操作
    		CheckedFunction0<T> checkedSupplier = RateLimiter.decorateCheckedSupplier(rateLimiter, funcion);
//    		CircuitBreakerUtil.printRateLimiterStatus(rateLimiter);
        	//再做熔断调用
    		checkedSupplier = CircuitBreaker.decorateCheckedSupplier(this.circuitBreaker, checkedSupplier);
        	//再做重发调用（如果熔断调用失败，进行重发，否则不重发）
    		checkedSupplier = Retry.decorateCheckedSupplier(retry, checkedSupplier);
//    		CircuitBreakerUtil.printRetryStatus(retry);
        	//如果执行结果出现异常，则返回降级结果，否则返回正常结果
        	Try<T> result = Try.of(checkedSupplier)
                    .recover(throwable -> {
                        logger.info("降级啦  ......");
                        return fallback.get();
                    });
             return result.get();
    	}
    }
    
    public void reset(){
    	this.circuitBreaker.reset();
    }
}
