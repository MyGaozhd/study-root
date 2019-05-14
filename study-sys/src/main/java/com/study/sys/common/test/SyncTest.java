package com.study.sys.common.test;

public class SyncTest {


    public static void main(String[] args) {
        new Thread(new Runnable() {
            @Override
            public void run() {
//                String a = "123";
                Object a = new Object();
                synchronized (a) {
                    int i = 0;
                    for (; i < 100; ) {
                        System.out.print("k" + i);
                        i++;
                    }

                }
            }
        }).start();

        new Thread(new Runnable() {
            @Override
            public void run() {
                Object a = new Object();
                synchronized (a) {
                    int i = 0;
                    for (; i < 100; ) {
                        System.out.print("h" + i);
                        i++;
                    }
                }
            }
        }).start();

        new Thread(new Runnable() {
            @Override
            public void run() {
                Object a = new Object();
                synchronized (a) {
                    int i = 0;
                    for (; i < 100; ) {
                        System.out.print("l" + i);
                        i++;
                    }

                }
            }
        }).start();
    }
}
