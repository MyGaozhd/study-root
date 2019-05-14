package com.study.sys.common.test;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

public class E {
    @PostConstruct
    public void init() {
        System.out.println("lllllllEEEEEEEEEElllllllll");
    }

    ;

    @PreDestroy
    public void destroy() {
        System.out.println("dddddddeeeeeeeeeeeeeeeeeddddddddddd");
    }

    ;
}
