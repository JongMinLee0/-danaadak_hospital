package com.dana.hos.member.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@ComponentScan("com.dana.hos")
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Bean
    public LoginSuccessHandler successHandler() {
      return new LoginSuccessHandler("/");
    }
	
	@Autowired
	private LoginFailureHandler loginFailureHandler;

	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
        .antMatchers("/login/loginForm").permitAll()
        .antMatchers("/home").permitAll()
        .antMatchers("/admin/**").hasRole("ADMIN")
        .antMatchers("/**").permitAll()
        .and().formLogin().successHandler(successHandler()).failureHandler(loginFailureHandler)
        .and().logout().logoutSuccessUrl("/home").permitAll()
        .and().headers().frameOptions().disable()
        .and().csrf().disable();
    }
	
    @Autowired
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
            .usersByUsernameQuery("select id as username, password, enabled FROM member WHERE ID=?")
            .authoritiesByUsernameQuery("select id as username, authority FROM member WHERE ID=?");
    }   
    
    
}