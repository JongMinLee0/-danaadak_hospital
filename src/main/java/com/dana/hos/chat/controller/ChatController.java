package com.dana.hos.chat.controller;

import javax.annotation.PostConstruct;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	// 채팅방에 메시지를 저장 key : roomID, data : ChatMessage
	private ListOperations<String, Object> opsListChatRoom;
	
	@PostConstruct
	public void init() {
		opsListChatRoom = redisTemplate.opsForList();
	}

	@MessageMapping("/chat/message")
	public void message(ChatMessage message) {
		ChatMessage storeMessage = message;
		if (ChatMessage.MessageType.ENTER.equals(message.getType())) {
			// 리스너 설정
			chatRoomRepository.enterChatRoom(message.getRoomId());
			/* message.setMessage(message.getSender() + "님이 입장하셨습니다."); */

			// 메시지를 저장해 준다. 지금 roomId, message, sender 저장 되어 있음, 시간만 저장해주면된다
		} else {
			String mTime = DateTime.now().toString("yyyy년MM월dd일 HH시mm분ss초");
			storeMessage.setTime(mTime);
			String roomId = message.getRoomId();
			String sender = message.getSender();
			String mes = message.getMessage();
			storeMessage.setMessage(mes);
			storeMessage.setRoomId(roomId);
			storeMessage.setSender(sender);
			Gson gson = new Gson();
			String json = gson.toJson(storeMessage);
			
			opsListChatRoom.rightPush(roomId, json);
			// Websocket에 발행된 메시지를 redis로 발행한다(publish)
			redisPublisher.publish(chatRoomRepository.getTopic(message.getRoomId()), message);
		}
	}

}
