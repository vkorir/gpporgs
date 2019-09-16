package com.gpporgs;

import com.gpporgs.model.User;
import com.gpporgs.service.UserService;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

import java.util.stream.Stream;

@SpringBootApplication
public class Application extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

//	@Bean
//	public PropertiesFactoryBean properties() {
//		PropertiesFactoryBean bean = new PropertiesFactoryBean();
//		bean.setLocation(new ClassPathResource("application.properties"));
//		return bean;
//	}
}
