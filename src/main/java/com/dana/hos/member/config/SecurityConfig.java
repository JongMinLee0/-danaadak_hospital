package com.dana.hos.member.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@ComponentScan("com.dana.hos")
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	 
	@Autowired
	DataSource dataSource;
	
	@Autowired
	private LoginSuccessHandler loginSuccessHandler;
	
	@Autowired
	private LoginFailureHandler loginFailureHandler;

	@Override
	public void configure(WebSecurity web) throws Exception
	{
		web.ignoring().antMatchers("/resources/**");
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	} 

	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
        .antMatchers("/login/**").permitAll()
        .antMatchers("/").permitAll()
        .antMatchers("/home").permitAll()
        .antMatchers("/myinfo/**").access("hasRole('USER')")
        .antMatchers("/map/**").access("hasRole('USER')")
        .antMatchers("/admin/**").hasRole("ADMIN")
        .antMatchers("/**").permitAll()
        .and().formLogin().loginPage("/login").permitAll().loginProcessingUrl("/login")
        				  .successHandler(loginSuccessHandler)
        				  .failureHandler(loginFailureHandler)
        .and().logout().logoutSuccessUrl("/home").permitAll()
        .and().sessionManagement()
        	.invalidSessionUrl("/login")
        	.maximumSessions(1)
        	.and()
        .and().exceptionHandling().accessDeniedPage("/login/accessDenied")
        .and().headers().frameOptions().disable()
        .and().csrf().disable();
    }
	
	@Autowired
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
        	.passwordEncoder(passwordEncoder())
        	.dataSource(dataSource)
            .usersByUsernameQuery("select username, password, enabled FROM member WHERE username=?")
            .authoritiesByUsernameQuery("select username, authority FROM member WHERE username=?");
    }

}