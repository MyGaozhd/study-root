package com.study.sys.common.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

    public static void main(String[] args) {
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-beans.xml");
        S s = (S) ac.getBean("s");
        String c = s.getA().getB().getC();
        System.out.print(c);
    }
}
