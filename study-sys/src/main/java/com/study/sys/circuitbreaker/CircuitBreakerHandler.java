package com.study.sys.circuitbreaker;

import java.time.Duration;
import java.util.UUID;
import java.util.function.Supplier;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.github.resilience4j.circuitbreaker.CircuitBreaker;
import io.github.resilience4j.circuitbreaker.CircuitBreaker.State;
import io.github.resilience4j.circuitbreaker.CircuitBreakerConfig;
import io.github.resilience4j.ratelimiter.RateLimiter;
import io.github.resilience4j.ratelimiter.RateLimiterConfig;
import io.github.resilience4j.retry.Retry;
import io.github.resilience4j.retry.RetryConfig;
import io.vavr.CheckedFunction0;
import io.vavr.control.Try;

/**
 * CircuitBreakerFactory
 *
 * @author liyang
 * @date 2018年12月28日 下午3:30:49
 */
public class CircuitBreakerHandler {

    private static final Logger logger = LoggerFactory.getLogger(CircuitBreakerHandler.class);

    /**
     * 断路器
     */
    private CircuitBreaker circuitBreaker = null;

    /**
     * 重发器
     */
    private Retry retry = null;

    /**
     * 限流器
     */
    private RateLimiter rateLimiter = null;


    private CircuitBreakerHandler(Builder builder) {
        String breakerName = UUID.randomUUID().toString();
        if (builder.circuitBreakerConfig != null) {
            this.circuitBreaker = CircuitBreaker.of(breakerName, builder.circuitBreakerConfig);
        }
        if (builder.retryConfig != null) {
            this.retry = Retry.of(breakerName, builder.retryConfig);
        }
        if (builder.rateLimiterConfig != null) {
            this.rateLimiter = RateLimiter.of(breakerName, builder.rateLimiterConfig);
        }
    }

    public static Builder init() {
        return new Builder();
    }

    public static CircuitBreakerHandler createHandler() {

        return init().configCircuiter(2).configRateLimiter(100, 100).configRetry(1).build();

    }

    /**
     * 执行参数funcion的lambda表达式结果，如果执行出现异常，或者熔断器开启，则返回 参数fallback的lambda表达式结果
     *
     * @param funcion
     * @param fallback
     * @return
     */
    public <T> T exec(CheckedFunction0<T> funcion, Supplier<T> fallback) {
//   	    CircuitBreakerUtil.printCircuitBreakerStatus(circuitBreaker);
        //如果断路器已经开启，则直接降级
        if (this.circuitBreaker != null && this.circuitBreaker.getState().equals(State.OPEN)) {
            logger.info("已经降级啦 ......");
            return fallback.get();
        } else {

            if (this.rateLimiter != null) {
                //先执行限流操作
                funcion = RateLimiter.decorateCheckedSupplier(this.rateLimiter, funcion);
            }
            if (this.circuitBreaker != null) {
                //再做熔断调用
                funcion = CircuitBreaker.decorateCheckedSupplier(this.circuitBreaker, funcion);
            }
            if (this.retry != null) {
                //再做重发调用（如果熔断调用失败，进行重发，否则不重发）
                funcion = Retry.decorateCheckedSupplier(this.retry, funcion);
            }
            //如果执行结果出现异常，则返回降级结果，否则返回正常结果
            Try<T> result = Try.of(funcion)
                    .recover(throwable -> {
                        logger.info("降级啦  ......");
                        return fallback.get();
                    });
            return result.get();
        }
    }

    public void reset() {
        this.circuitBreaker.reset();
    }

    public static class Builder {

        private CircuitBreakerConfig circuitBreakerConfig = null;
        private RetryConfig retryConfig = null;
        private RateLimiterConfig rateLimiterConfig = null;

        /**
         * configCircuiter
         * 熔断配置
         *
         * @param ringBufferSize 状态切换缓冲值
         * @return
         */
        public Builder configCircuiter(int ringBufferSize) {
            this.circuitBreakerConfig = CircuitBreakerConfig.custom().ringBufferSizeInClosedState(ringBufferSize).ringBufferSizeInHalfOpenState(ringBufferSize)
                    .waitDurationInOpenState(Duration.ofMillis(1000)).enableAutomaticTransitionFromOpenToHalfOpen().build();
            return this;
        }

        /**
         * configRetry
         * 重试配置
         *
         * @param maxAttempts 可重试的最大次数
         * @return
         */
        public Builder configRetry(int maxAttempts) {
            this.retryConfig = RetryConfig.custom().maxAttempts(maxAttempts).build();
            return this;
        }

        /**
         * configRateLimiter
         * 限流配置
         *
         * @param period    单位时间
         * @param frequency 访问次数
         * @return
         */
        public Builder configRateLimiter(long period, int frequency) {
            this.rateLimiterConfig = RateLimiterConfig.custom().limitRefreshPeriod(Duration.ofMillis(period)).limitForPeriod(frequency).build();
            return this;
        }

        public CircuitBreakerHandler build() {
            return new CircuitBreakerHandler(this);
        }
    }
}
