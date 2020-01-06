package com.evall.pweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages = { "com.evall.pweb" })
public class EvAllPwebApplication extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(EvAllPwebApplication.class, args);
    }
}
