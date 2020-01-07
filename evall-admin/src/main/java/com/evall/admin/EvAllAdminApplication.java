package com.evall.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;

@Controller
@SpringBootApplication(scanBasePackages = { "com.evall.admin" })
public class EvAllAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(EvAllAdminApplication.class, args);
    }
}
