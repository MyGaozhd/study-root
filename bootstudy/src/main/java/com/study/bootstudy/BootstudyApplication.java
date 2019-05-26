package com.study.bootstudy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class BootstudyApplication {

    @Bean
    public Runnable create() {
        return () -> {
            System.out.println("lllllllllllllll");
        };
    }

    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(BootstudyApplication.class, args);
        context.getBean(Runnable.class).run();
    }

}
