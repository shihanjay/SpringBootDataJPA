package com.springboot.java.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = "com.springboot.java.controller")
@EnableJpaRepositories(basePackages = "com.springboot.java.dao")
@EntityScan(basePackages = "com.springboot.java.pojo")
public class SpringBootH2JpaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootH2JpaApplication.class, args);
	}

}
