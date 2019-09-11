package com.dana.hos.main.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/*
 * DataBase mybatis 설정 파일
 */

@Configuration
public class DatabaseConfig {
	

	@Autowired
	private ApplicationContext applicationContext;

	@Bean(name="dataSource")
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		//DriverManagerDataSource source = new DriverManagerDataSource();
		// Mybatis에서 오류 발생시 로그가 찍히게 하기 위한 설정
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:oracle:thin:@192.168.30.91:1521:xe");
		hikariConfig.setUsername("my_hos");
		hikariConfig.setPassword("a1234");
		hikariConfig.setMinimumIdle(10);
		hikariConfig.setMaximumPoolSize(30);
		hikariConfig.setConnectionTimeout(300000);
		
		
		HikariDataSource dataSource = new HikariDataSource(hikariConfig);

		return dataSource;
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());
		sqlSessionFactoryBean
				.setConfigLocation(applicationContext.getResource("classpath:mybatis/config/mybatis-config.xml"));
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/*.xml"));

		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSession sqlSession() throws Exception {
		SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory());
		return sqlSessionTemplate;
	}
}
