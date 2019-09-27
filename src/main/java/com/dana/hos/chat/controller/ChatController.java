package com.dana.hos.chat.controller;

import javax.annotation.PostConstruct;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dana.hos.chat.module.ChatMessage;
import com.dana.hos.chat.repo.ChatRoomRepository;
import com.dana.hos.chat.service.RedisPublisher;
import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private RedisPublisher redisPublisher;

	@Autowired
	private ChatRoomRepository chatRoomRepository;

	@Autowired
	private RedisTemplate<String, Object> redisTemplate;

	// 채팅방에 메시지를 저장
	private HashOperations<String, String, ChatMessage> opsHashChatRoom;

	@PostConstruct
	public void init() {
		opsHashChatRoom = redisTemplate.opsForHash();
	}

	@MessageMapping("/chat/message")
	public void message(ChatMessage message) {
		ChatMessage storeMessage = message;
		/*
		 * if (ChatMessage.MessageType.ENTER.equals(message.getType())) { // 리스너 설정
		 * chatRoomRepository.enterChatRoom(message.getRoomId());
		 * message.setMessage(message.getSender() + "님이 입장하셨습니다.");
		 * 
		 * // 메시지를 저장해 준다. } else {
		 */
		String mTime = DateTime.now().toString("yyyy년MM월dd일 HH시mm분ss초");
		storeMessage.setTime(mTime);
		String roomId = message.getRoomId();
		String sender = message.getSender();
		// textarea 줄바꿈 처리
		String mes = message.getMessage();
		storeMessage.setMessage(mes);
		storeMessage.setRoomId(roomId);
		storeMessage.setSender(sender);

		// roomId, time, ChatMessage => Hash 형태로 저장
		if(ChatMessage.MessageType.ENTER.equals(message.getType())) {
			chatRoomRepository.enterChatRoom(roomId);
			/*if(message.getReciver()!=null) {
				chatRoomRepository.enterChatRoom(message.getReciver());
			}*/
		}else {
			if(roomId.length()>30) {
				opsHashChatRoom.put(roomId, mTime, storeMessage);
			}
			redisPublisher.publish(chatRoomRepository.getTopic(message.getRoomId()), message);
		}
		/*if(message.getReciver()!=null) {
			System.out.println("reciver한테 pub..................");
			redisPublisher.publish(chatRoomRepository.getTopic(message.getReciver()), message);
		}*/
		
	}

}
