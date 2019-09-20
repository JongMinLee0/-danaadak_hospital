package com.dana.hos.chat.module;

import java.io.Serializable;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoom implements Serializable{
	
	private static final long serialVersionUID = 6494678977089006639L;
	
	private String roomId; // 채팅방번호 고유값
	private String name1; // 채팅요청자
	private String name2; // 후기글작성자
	private String exist; // 이미 존재하는지 여부를 저장
	
	// 이미 존재하는 경우 Controller에서 생성하여 return 해준다.
	public ChatRoom existCreate() {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.exist = "이미 대화중인 상대입니다!!";
		return chatRoom;
	}
	
	public static ChatRoom create(String name1, String name2) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.roomId = UUID.randomUUID().toString();
		chatRoom.name1 = name1;
		chatRoom.name2 = name2;
		return chatRoom;
	}
}
