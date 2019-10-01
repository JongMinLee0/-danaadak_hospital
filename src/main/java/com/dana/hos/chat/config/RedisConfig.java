package com.dana.hos.chat.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {
	private final String host = "hos-redis.gwtum9.0001.apn2.cache.amazonaws.com";
	private final int port = 6379;

	// JedisConnectionFactory 인스턴스를 통해 Redis와 연결할 수 있다.
	// Redis-server의 포트는 기본값으로 6379를 사용한다.
	@Bean
	public JedisConnectionFactory connectionFactory() {
		// Spring Data Redis 2.0에서는 이런방식으로 설정해 주어야 한다.
		RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration(host, port);
		// redisStandaloneConfiguration.setPassword(RedisPassword.of("1234"));
		return new JedisConnectionFactory(redisStandaloneConfiguration);
	}

	// Redis 데이터에 쉽게 접근하기 위한 코드를제공
	// redisTemplate을 JedisConnectionFactory와 연결하고 Redis 데이터간에 (역)직렬화를 자동으로 해주는
	// StringRedisSerializer를 설정
	@Bean
	public RedisTemplate<String, Object> redisTemplate() {
		RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
		redisTemplate.setConnectionFactory(connectionFactory());
		redisTemplate.setKeySerializer(new StringRedisSerializer());
		redisTemplate.setValueSerializer(new Jackson2JsonRedisSerializer<>(String.class));
		
		return redisTemplate;
	}

	// Redis pub/sub 메시지를 처리하는 listner 설정
	@Bean
	public RedisMessageListenerContainer redisMessageListenerContainer(RedisConnectionFactory redisConnectionFactory) {
		RedisMessageListenerContainer container = new RedisMessageListenerContainer();
		container.setConnectionFactory(redisConnectionFactory);
		return container;
	}

}
