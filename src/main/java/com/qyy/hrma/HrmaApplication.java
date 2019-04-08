package com.qyy.hrma;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class HrmaApplication {

    public static void main(String[] args) {
        SpringApplication.run(HrmaApplication.class, args);
    }

}
