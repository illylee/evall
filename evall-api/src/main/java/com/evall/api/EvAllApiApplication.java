package com.evall.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@SpringBootApplication(scanBasePackages = { "com.evall.api" })
public class EvAllApiApplication extends SpringBootServletInitializer {


    @RequestMapping("/")
    public String home(){
        return "hello, EV ALL api";
    }

    public static void main(String[] args) {
        SpringApplication.run(EvAllApiApplication.class, args);
    }


}
