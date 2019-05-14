package com.study.sys.circuitbreaker;

import java.time.Duration;
import java.util.Properties;

import io.github.resilience4j.circuitbreaker.CircuitBreakerConfig;
import io.github.resilience4j.ratelimiter.RateLimiterConfig;
import io.github.resilience4j.retry.RetryConfig;

/**
 * CircuitBreakerConf
 * @author liyang
 * @date 2018年12月28日 下午3:30:16
 */
public class CircuitBreakerConf {

	private static CircuitBreakerConfig circuitBreakerConfig = null;

	private static RetryConfig retryConfig = null;

	private static RateLimiterConfig rateLimiterConfig = null;

	/**
	 * 熔断器在关闭状态时环状缓冲区的大小
	 */
	public static int CB_ringBufferSizeInClosedState = 2;
	/**
	 * 熔断器在半打开状态时环状缓冲区的大小
	 */
	public static int CB_ringBufferSizeInHalfOpenState = 2;
	/**
	 * 触发熔断的失败率阈值(失败影响状态的概率)
	 */
	public static int CB_failureRateThreshold = 10;
	/**
	 * 熔断器从打开状态到半开状态的等待时间(秒)
	 */
	public static int CB_waitDurationInOpenState = 1;
	/**
	 * 最大重试次数
	 */
	public static int RETRY_maxAttempts = 1;
	/**
	 * 超时刷新时间(毫秒)
	 */
	public static int RL_timeoutDuration = 100;
	/**
	 * limit时限(毫秒)
	 */
	public static int RL_limitRefreshPeriod = 100;
	/**
	 * limit时限内的可执行次数
	 */
	public static int RL_limitForPeriod = 1;

	public static CircuitBreakerConfig getCircuitBreakerConfig() {
		if (circuitBreakerConfig == null) {
			circuitBreakerConfig = CircuitBreakerConfig.custom()
					// 熔断器在关闭状态时环状缓冲区的大小
					.ringBufferSizeInClosedState(CB_ringBufferSizeInClosedState)
					// 熔断器在半打开状态时环状缓冲区的大小
					.ringBufferSizeInHalfOpenState(CB_ringBufferSizeInHalfOpenState)
					// 触发熔断的失败率阈值
					.failureRateThreshold(CB_failureRateThreshold)
					// 熔断器从打开状态到半开状态的等待时间
					.waitDurationInOpenState(Duration.ofSeconds(CB_waitDurationInOpenState))
					.enableAutomaticTransitionFromOpenToHalfOpen()
					.build();
		}
		return circuitBreakerConfig;
	}

	public static RetryConfig getRetryConfig() {
		if (retryConfig == null) {
			retryConfig = RetryConfig.custom()
					// 最大重试次数
					.maxAttempts(RETRY_maxAttempts).build();
		}
		return retryConfig;
	}

	public static RateLimiterConfig getRateLimiterConfig() {
		if (rateLimiterConfig == null) {
			rateLimiterConfig = RateLimiterConfig.custom()
					// 超时刷新时间
					.timeoutDuration(Duration.ofMillis(RL_timeoutDuration))
					// limit时限
					.limitRefreshPeriod(Duration.ofMillis(RL_limitRefreshPeriod))
					// limit时限内的可执行次数
					.limitForPeriod(RL_limitForPeriod).build();
		}
		return rateLimiterConfig;
	}

	public static void init(Properties properties){
		try {
			CircuitBreakerConf.CB_ringBufferSizeInClosedState = Integer.valueOf(properties.getProperty("circuitbreaker.ringbuffer").trim());
			CircuitBreakerConf.CB_ringBufferSizeInHalfOpenState = Integer.valueOf(properties.getProperty("circuitbreaker.ringbuffer").trim());
			CircuitBreakerConf.CB_waitDurationInOpenState = Integer.valueOf(properties.getProperty("circuitbreaker.waitstatechange").trim());
			
			CircuitBreakerConf.RETRY_maxAttempts = Integer.valueOf(properties.getProperty("circuitbreaker.retry.maxattempts").trim());
			
			CircuitBreakerConf.RL_timeoutDuration = Integer.valueOf(properties.getProperty("circuitbreaker.limit.timeout").trim());
			CircuitBreakerConf.RL_limitRefreshPeriod = Integer.valueOf(properties.getProperty("circuitbreaker.limit.refreshtime").trim());
			CircuitBreakerConf.RL_limitForPeriod = Integer.valueOf(properties.getProperty("circuitbreaker.limit.number").trim());
		} catch (Exception e) {
		}
	}
	
}
