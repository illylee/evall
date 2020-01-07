package com.evall.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = { "com.evall.api" })
public class EvAllApiApplication{

    public static void main(String[] args) {
        SpringApplication.run(EvAllApiApplication.class, args);
    }

}
