package com.study.sys.circuitbreaker;

import io.vavr.CheckedFunction0;

import java.util.function.Supplier;

public class TestCircuitbreaker {

    public static void main(String[] args) throws InterruptedException {
//		  RootConf.init();

        TestService ts = new TestService();

        CircuitBreakerHandler handler = CircuitBreakerHandler.init().configCircuiter(2).configRateLimiter(100, 100).configRetry(5).build();

        Supplier supplier = new Supplier() {
            @Override
            public Object get() {
                return "bb";
            }
        };

        for (int i = 0; i < 5; i++) {

            final int k = i;
            CheckedFunction0 function0 = new CheckedFunction0() {
                @Override
                public Object apply() throws Throwable {
                    return ts.checkUser(k);
                }
            };
            System.out.println(handler.exec(function0, supplier));
            Thread.sleep(1000);
        }

    }
}
