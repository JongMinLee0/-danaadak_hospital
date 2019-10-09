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
import org.springframework.jdbc.datasource.DriverManagerDataSource;


/*
 * DataBase mybatis 설정 파일
 */

@Configuration
public class DatabaseConfig {
	

	@Autowired
	private ApplicationContext applicationContext;

	@Bean(name="dataSource")
	public DataSource dataSource() {
		
		//DriverManagerDataSource source = new DriverManagerDataSource();
		// Mybatis에서 오류 발생시 로그가 찍히게 하기 위한 설정
		//oracle11g.cvbptbyjtnd2.ap-northeast-2.rds.amazonaws.com  ORCL
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		dataSource.setUrl("jdbc:log4jdbc:oracle:thin:@oracle11g.cvbptbyjtnd2.ap-northeast-2.rds.amazonaws.com:1521:ORCL");
		dataSource.setUsername("my_hos");
		dataSource.setPassword("tnthd2351!");

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
