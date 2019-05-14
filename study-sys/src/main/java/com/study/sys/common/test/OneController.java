package com.study.sys.common.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class OneController {
    @Autowired
    private OneService service;

    public void show() {
        System.out.println("S" + service.toString());
    }
}
