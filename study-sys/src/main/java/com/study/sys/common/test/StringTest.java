package com.study.sys.common.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StringTest {

    public static void main(String[] args) {
        StringBuilder s = new StringBuilder();
        s.append("1");
        s.append("1");
        s.append("1");
        s.append("1");
        s.append(",");
        s.deleteCharAt(s.length()-1);
        System.out.println(s.toString());
    }
}
