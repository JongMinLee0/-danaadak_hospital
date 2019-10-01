package com.dana.hos.chat.module;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessage implements Serializable{
	
	private static final long serialVersionUID = 6494678977089006639L;
	
	// 메시지 타입 : 입장, 채팅, 나가기
	public enum MessageType{
		ENTER, TALK, EXIT
	}
	private MessageType type; // 메시지 타입
	private String roomId; // 방번호
	private String sender; // 메시지 보낸사람
	private String reciver; // 메시지 받는사람
	private String message; // 메시지
	private String time; // 메시지 보낸 시간
	private String profile_image; // 프로필 이미지
}
