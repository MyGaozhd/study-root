package com.study.sys.common.test;

import org.springframework.beans.factory.FactoryBean;

public class RunnableFactoryBean implements FactoryBean<A> {

    @Override
    public A getObject() {
        return new A();
    }

    @Override
    public boolean isSingleton() {
        return false;
    }

    @Override
    public Class<?> getObjectType() {
        return A.class;
    }
}
