package com.mycompany.invoise;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jdbc.repository.config.EnableJdbcRepositories;

import javax.management.Query;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@SpringBootApplication
public class InvoiseWebApplication {

	public static void main(String[] args) {

		SpringApplication.run(InvoiseWebApplication.class, args);

	}

}
