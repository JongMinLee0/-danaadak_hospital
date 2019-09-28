package com.dana.hos.member.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Component
@EnableTransactionManagement
@EnableOAuth2Client
public class BootSocialApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootSocialApplication.class, args);
    }

    @Value("f90d0bc90a5a0e00f6930fef7657156e")
    private String kakaoRestApiKey;

    @Value("https://kauth.kakao.com/oauth/token")
    private String kakaoAccessTokenUri;

    @Value("https://kauth.kakao.com/oauth/authorize")
    private String kakaoUserAuthorizationUri;

    @Value("http://localhost:8090/hos/kakaoLogin")
    private String kakaoRedirectUri;

    @Bean
    public OAuth2ProtectedResourceDetails kakao() {
        AuthorizationCodeResourceDetails details = new AuthorizationCodeResourceDetails();
        details.setId("kakao");
        details.setClientId(kakaoRestApiKey);
        details.setAccessTokenUri(kakaoAccessTokenUri);
        details.setUserAuthorizationUri(kakaoUserAuthorizationUri);
        details.setPreEstablishedRedirectUri(kakaoRedirectUri);
        details.setTokenName("access_token");

        return details;
    }

    @Bean
    public OAuth2RestTemplate kakaoRestTemplate(OAuth2ClientContext clientContext) {
        return new OAuth2RestTemplate(kakao(), clientContext);
    }

}
