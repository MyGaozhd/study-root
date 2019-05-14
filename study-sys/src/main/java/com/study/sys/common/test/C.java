package com.study.sys.common.test;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class C implements InitializingBean , DisposableBean {

    @Override
    public void afterPropertiesSet() {
        System.out.println("llllllllllllllll");
    }

    @Override
    public void destroy() {
        System.out.println("dddddddddddddddddddd");
    }
}
