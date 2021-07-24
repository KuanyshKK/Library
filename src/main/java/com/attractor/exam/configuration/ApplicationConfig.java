package com.attractor.exam.configuration;

import com.attractor.exam.service.StorageService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApplicationConfig {
    @Bean
    CommandLineRunner init(StorageService storageService){
        return (args) -> {
            storageService.init();
        };
    }
}