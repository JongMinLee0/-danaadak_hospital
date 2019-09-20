package com.dana.hos.chat.controller;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
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
	
	// 채팅방에 메시지를 저장 key : roomID, data : ChatMessage
	private ListOperations<String, Object> opsListChatRoom; 

	@MessageMapping("/chat/message")
	public void message(ChatMessage message) {
		if (ChatMessage.MessageType.ENTER.equals(message.getType())) {
			// 리스너 설정
			chatRoomRepository.enterChatRoom(message.getRoomId());
			/*message.setMessage(message.getSender() + "님이 입장하셨습니다.");*/
			
			// 메시지를 저장해 준다. 지금 roomId, message, sender 저장 되어 있음, 시간만 저장해주면된다.
			String mTime = DateTime.now().toString("yyyy년MM월dd일 HH시mm분ss초");
			message.setTime(mTime);
			opsListChatRoom.rightPush(message.getRoomId(), message);
			
		}
		// Websocket에 발행된 메시지를 redis로 발행한다(publish)
		redisPublisher.publish(chatRoomRepository.getTopic(message.getRoomId()), message);
	}
	
	
}
