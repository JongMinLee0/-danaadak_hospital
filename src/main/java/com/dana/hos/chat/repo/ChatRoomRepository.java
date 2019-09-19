package com.dana.hos.chat.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Repository;

import com.dana.hos.chat.module.ChatRoom;
import com.dana.hos.chat.service.RedisSubscriber;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ChatRoomRepository {
	// 채팅방(topic)에 발행되는 메시지를 처리할 Listner
	@Autowired
	private RedisMessageListenerContainer redisMessageListenerContainer;

	// 구독처리 서비스
	@Autowired
	private RedisSubscriber redisSubscriber;

	@Autowired
	private RedisTemplate<String, Object> redisTemplate;

	// Redis
	private static final String CHAT_ROOMS = "CHAT_ROOM";
	private HashOperations<String, String, ChatRoom> opsHashChatRoom;
	private ListOperations<String, Object> opsListChatRoom;

	// 채팅방의 대화 메시지를 발행하기 위한 redis topic 정보. 서버별로 채팅방에 매치되는 topic정보를 Map에 넣어
	// roomId로 찾을 수 있도록 한다
	private Map<String, ChannelTopic> topics;

	@PostConstruct
	public void init() {
		opsHashChatRoom = redisTemplate.opsForHash();
		opsListChatRoom = redisTemplate.opsForList();
		
		topics = new HashMap<>();
	}

	// 모든 채팅방 찾기
	public List<ChatRoom> findAllRoom() {
		return opsHashChatRoom.values(CHAT_ROOMS);
	}

	/* roomID로 채팅방 찾기 */
	public ChatRoom findRoomById(String id) {
		return opsHashChatRoom.get(CHAT_ROOMS, id);
	}

	/**
	 * 채팅방 생성 : 서버간 채팅방 공유를 위해 redis hash에 저장한다.
	 */
	public ChatRoom createChatRoom(String name1, String name2) {
		ChatRoom chatRoom = ChatRoom.create(name1, name2);
		opsHashChatRoom.put(CHAT_ROOMS, chatRoom.getRoomId(), chatRoom);
		opsListChatRoom.leftPush(name1, chatRoom.getRoomId());
		opsListChatRoom.leftPush(name2, chatRoom.getRoomId());
		return chatRoom;
	}

	/**
	 * 채팅방 입장 : redis에 topic을 만들고 pub/sub 통신을 하기 위해 리스너를 설정한다.
	 */
	public void enterChatRoom(String roomId) {
		ChannelTopic topic = topics.get(roomId);
		if (topic == null) {
			topic = new ChannelTopic(roomId);
			redisMessageListenerContainer.addMessageListener(redisSubscriber, topic);
			topics.put(roomId, topic);
		}
	}

	// 서로 이미 채팅중인지를 확인하는 메소드
	public boolean existRoom(String name1, String name2) {
		List<Object> firstList = opsListChatRoom.range(name1, 0, -1);
		List<Object> secondList = opsListChatRoom.range(name2, 0, -1);

		for (Object obj : firstList) {
			if (secondList.contains(obj)) {
				return true;
			}
		}
		return false;
	}

	public ChannelTopic getTopic(String roomId) {
		return topics.get(roomId);
	}
}
