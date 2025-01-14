package com.dana.hos.chat.repo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Repository;

import com.dana.hos.chat.module.ChatMessage;
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
	// private static final String CHAT_ROOMS = "CHAT_ROOM";
	private HashOperations<String, String, ChatRoom> opsHashChatRoom; // 채팅방 정보 (방번호, 이름1, 이름2)
	private HashOperations<String, String, ChatMessage> opsHashChatRoom2; // 메시지를 담고 있다.
	// private ListOperations<String, Object> opsListChatRoom; // id에 저장되어 있는 채팅방 정보

	/*
	 * @Resource(name = "redisTemplate") private ListOperations<String, String>
	 * listOperation;
	 * 
	 */

	// 채팅방의 대화 메시지를 발행하기 위한 redis topic 정보. 서버별로 채팅방에 매치되는 topic정보를 Map에 넣어
	// roomId로 찾을 수 있도록 한다
	private Map<String, ChannelTopic> topics;

	@PostConstruct
	public void init() {
		opsHashChatRoom = redisTemplate.opsForHash();
		opsHashChatRoom2 = redisTemplate.opsForHash();
		/* opsListChatRoom = redisTemplate.opsForList(); */
		topics = new HashMap<>();
	}

	// 모든 채팅방 찾기
	public List<ChatRoom> findAllRoom(String username) {
		return opsHashChatRoom.values(username);
	}

	/* roomID로 채팅방 찾기 */
	public ChatRoom findRoomById(String username, String roomId) {
		return opsHashChatRoom.get(username, roomId);
	}

	/**
	 * 채팅 생성 : 서버간 채팅방 공유를 위해 redis hash에 저장한다.
	 */
	public ChatRoom createChatRoom(String name1, String name2) {
		ChatRoom chatRoom = ChatRoom.create(name1, name2);
		// List로 저장한 것을 Hash로 변경
		/*
		 * opsHashChatRoom.put(CHAT_ROOMS, chatRoom.getRoomId(), chatRoom);
		 * opsListChatRoom.leftPush(name1, chatRoom.getRoomId());
		 * opsListChatRoom.leftPush(name2, chatRoom.getRoomId());
		 */

		// username, roomId, opponent => Hash로 저장
		opsHashChatRoom.put(name1, chatRoom.getRoomId(), chatRoom);
		opsHashChatRoom.put(name2, chatRoom.getRoomId(), chatRoom);
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

	// 유저가 속해있는 모든 채팅방 정보
	public List<ChatRoom> roomList(String username) {
		return opsHashChatRoom.values(username);
	}

	// 해당 채팅방에 존재하는 모든 메시지를 가져온다.
	public List<ChatMessage> roomMessage(String roomId) {
		return opsHashChatRoom2.values(roomId);
	}

	// 서로 이미 채팅중인지를 확인하는 메소드
	public boolean existRoom(String name1, String name2) {
		List<ChatRoom> firstList = roomList(name1);
		List<ChatRoom> secondList = roomList(name2);
		List<String> secondRoom = new ArrayList<>();
		for (ChatRoom str1 : secondList) {
			secondRoom.add(str1.getRoomId());
		}
		for (ChatRoom str : firstList) {
			if (secondRoom.contains(str.getRoomId())) {
				return true;
			}
		}
		return false;
	}

	// 채팅방 나가기
	// key에서 채팅방을 삭제하고 사용자들 리스트에서도 채팅방을 삭제해야 한다.
	public void exitRoom(String roomId, String name1, String name2) {
		// 필드삭제
		opsHashChatRoom.delete(name1, roomId);
		opsHashChatRoom.delete(name2, roomId);
		// 키삭제
		redisTemplate.delete(roomId);
	}

	public ChannelTopic getTopic(String roomId) {
		return topics.get(roomId);
	}

	// 존재하는 모든 key 정보를 출력해준다.
	public Set allKeys() {
		return redisTemplate.keys("*");
	}

	// 시간이 지난 메세지를 지워준다.
	public void deleteMessage(String roomId, String time) {
		opsHashChatRoom2.delete(roomId, time);
	}

}
