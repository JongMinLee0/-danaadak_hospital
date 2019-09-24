package com.dana.hos.chat.module;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatList {

	private String opponent; // 채팅 대상
	private String message; //
	private String roomId; // 방번호
	private String time; // 시간
	/*
	 ChatMessage 요소
	 type // 메시지 타입
	 roomId // 방번호
	 sender // 메시지 보낸사람
	 message // 메시지
	 time // 메시지 보낸사람 
	 */
}
