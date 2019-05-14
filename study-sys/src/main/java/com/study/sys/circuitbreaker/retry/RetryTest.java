package com.study.sys.circuitbreaker.retry;

import com.study.sys.common.test.OneService;
import io.github.resilience4j.retry.Retry;
import io.github.resilience4j.retry.RetryConfig;
import io.vavr.CheckedFunction0;
import io.vavr.CheckedFunction1;
import io.vavr.CheckedFunction2;

import java.time.Duration;
import java.util.function.Function;
import java.util.function.Supplier;

public class RetryTest {
    private int executeTimes = 0;

    public void doRetry() {
        RetryConfig config = RetryConfig.custom()
                .maxAttempts(5)
                .waitDuration(Duration.ofMillis(1000))
                .retryExceptions(RuntimeException.class)
//                .ignoreExceptions(RetryNoNeedException.class)
                .retryOnException(throwable -> throwable instanceof RuntimeException)
                .build();

        Retry retry = Retry.of("sync retry", config);

        retryOnException(retry);
    }

    public void retryOnException(Retry retry) {
        Supplier<String> supplier1 = new OneService();
        Supplier<String> supplier = Retry.decorateSupplier(retry, supplier1);
        String result = supplier.get();

        System.out.println(result);
//        Retry.decorateFunction()
        CheckedFunction2 function2 = new CheckedFunction2() {
            @Override
            public Object apply(Object o, Object o2) throws Throwable {
                return null;
            }
        };

        CheckedFunction1 function1 = new CheckedFunction1() {
            @Override
            public String apply(Object o) throws Throwable {
                System.out.println(o + ":llllll");
                return new OneService().doOne();
            }
        };
        try {
            String re = (String) Retry.decorateCheckedSupplier(retry, new CheckFunction(1, "a")).apply();
            //  String re = (String) Retry.decorateCheckedFunction(retry, function1).apply("s");
            System.out.println(result);
        } catch (Exception e) {
        } catch (Throwable throwable) {

        }

        Retry.decorateRunnable(retry, new Runnable() {
            @Override
            public void run() {
                if (executeTimes++ < 3) {
//                        throw RetryNeedException.defaultException();
                    System.out.println(executeTimes);
                    throw new RuntimeException();
                }
            }
        }).run();
    }

    public void dod() {
    }

    public static void main(String[] args) {
        new RetryTest().doRetry();
    }

    class CheckFunction implements CheckedFunction0 {

        int a;
        String b;

        public CheckFunction(int a, String b) {
            this.a = a;
            this.b = b;
        }

        @Override
        public Object apply() {
            return "" + a + b;
        }
    }
}
