package com.study.sys.common.test;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

@Configuration
public class MyConfig {

    @Bean
    public E createE() {
        return new E();
    }

    @Bean(initMethod = "init", destroyMethod = "destroy")
    public D createD() {
        return new D();
    }

    @Bean
    public C createC() {
        return new C();
    }

    @Bean(name = "mybean")
    @Scope("prototype")
    public MyBean createMyBean() {
        return new MyBean();
    }

    @Bean(name = "RunnableFactoryBean")
    public RunnableFactoryBean createRunnableFactoryBean() {
        return new RunnableFactoryBean();
    }

    @Bean
    public BFactoryBean createBFactoryBean() {
        return new BFactoryBean();
    }

    @Bean
    public B createB(BFactoryBean bFactoryBean) {
        return bFactoryBean.create();
    }
}
