package com.study.sys.concurrent;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

public class Test {

    public static void main(String[] args) {
        FutureTask<String> futureTask = new FutureTask<>(new TestCallable("a"));
        ExecutorService service = Executors.newFixedThreadPool(2);
        service.submit(futureTask);
        try {
            System.out.println(System.currentTimeMillis());
            String result = futureTask.get();
            System.out.println(System.currentTimeMillis());
            System.out.println(result);
        } catch (Exception e) {

        }
    }


}
