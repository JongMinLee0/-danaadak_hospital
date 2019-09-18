package com.dana.hos.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dana.hos.chat.module.ChatMessage;
import com.dana.hos.chat.repo.ChatRoomRepository;
import com.dana.hos.chat.service.RedisPublisher;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private RedisPublisher redisPublisher;

	@Autowired
	private ChatRoomRepository chatRoomRepository;

	@MessageMapping("/chat/message")
	public void message(ChatMessage message) {
		if (ChatMessage.MessageType.ENTER.equals(message.getType())) {
			chatRoomRepository.enterChatRoom(message.getRoomId());
			message.setMessage(message.getSender() + "님이 입장하셨습니다.");
		}
		// Websocket에 발행된 메시지를 redis로 발행한다(publish)
		redisPublisher.publish(chatRoomRepository.getTopic(message.getRoomId()), message);
	}
}
