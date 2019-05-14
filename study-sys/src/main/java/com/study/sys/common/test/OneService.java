package com.study.sys.common.test;

import org.springframework.stereotype.Service;

import java.util.function.Supplier;

@Service
public class OneService implements Supplier<String> {
    public String doOne() {
        return "one";
    }

    @Override
    public String get() {
        return doOne();
    }
}
