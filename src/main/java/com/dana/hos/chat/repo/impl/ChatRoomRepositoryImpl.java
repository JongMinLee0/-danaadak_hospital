package com.dana.hos.chat.repo.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Repository;

import com.dana.hos.chat.module.ChatRoom;
import com.dana.hos.chat.repo.ChatRoomRepository;
import com.dana.hos.chat.service.RedisSubscriber;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ChatRoomRepositoryImpl implements ChatRoomRepository {

	// 채팅방(topic)에 발행되는 메시지를 처리할 Listner
	@Autowired
	private RedisMessageListenerContainer redisMessageListenerContainer;

	// 구독 처리 서비스
	@Autowired
	private RedisSubscriber redisSubscriber;

	@Autowired
	private RedisTemplate<String, Object> redisTemplate;

	// Redis
	private static final String CHAT_ROOMS = "CHAT_ROOM";
	private HashOperations<String, String, ChatRoom> opsHashChatRoom;

	// 채팅방의 대화 메시지를 발행하기 위한 redis topic 정보. 서버별로 채팅방에 매치되는 topic정보를 Map에 넣어
	// roomId로 찾을 수 있도록 한다
	private Map<String, ChannelTopic> topics;

	@Override
	public void init() {
		opsHashChatRoom = redisTemplate.opsForHash();
		topics = new HashMap<String, ChannelTopic>();

	}

	@Override
	public List<ChatRoom> findAllRoom() {
		return opsHashChatRoom.values(CHAT_ROOMS);
	}

	@Override
	public ChatRoom findRoomById(String id) {
		return opsHashChatRoom.get(CHAT_ROOMS, id);
	}

	/**
	 * 채팅방 생성 : 서버간 채팅방 공유를 위해 redis hash에 저장한다.
	 */
	@Override
	public ChatRoom createChatRoom(String name) {
		ChatRoom chatRoom = ChatRoom.create(name);
		opsHashChatRoom.put(CHAT_ROOMS, chatRoom.getRoomId(), chatRoom);
		return chatRoom;
	}

	/**
	 * 채팅방 입장 : redis에 topic을 만들고 pub/sub 통신을 하기 위해 리스너를 설정한다.
	 */
	@Override
	public void enterChatRoom(String roomId) {
		ChannelTopic topic = topics.get(roomId);
		if (topic == null) {
			topic = new ChannelTopic(roomId);
			redisMessageListenerContainer.addMessageListener(redisSubscriber, topic);
			topics.put(roomId, topic);
		}
	}

	@Override
	public ChannelTopic getTopic(String roomId) {
		return topics.get(roomId);
	}

}
