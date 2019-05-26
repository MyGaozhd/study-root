package com.study.sys.concurrent;

import java.util.concurrent.Callable;

public class TestCallable implements Callable<String> {
    private String a;

    public TestCallable(String a) {
        this.a = a;
    }

    @Override
    public String call() {
        try {
            Thread.sleep(500);

        } catch (Exception e) {

        }
        return "kkkk:" + a;
    }
}
