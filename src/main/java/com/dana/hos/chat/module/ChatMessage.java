package com.dana.hos.chat.module;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessage {
	
	// 메시지 타입 : 입장, 채팅, 나가기
	public enum MessageType{
		ENTER, TALK, EXIT
	}
	private MessageType type; // 메시지 타입
	private String roomId; // 방번호
	private String sender; // 메시지 보낸사람
	private String message; // 메시지
}
