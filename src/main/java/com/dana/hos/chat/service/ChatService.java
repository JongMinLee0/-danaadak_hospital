package com.dana.hos.chat.service;

import java.util.List;

import com.dana.hos.chat.module.ChatList;
import com.dana.hos.chat.module.ChatMessage;

public interface ChatService {

	// 초기 채팅 리스트 입장시
	public List<ChatList> chatList(String id);
	
	// 초기 채팅방 진입시 메시지 목록
	public List<ChatMessage> messageList(String roomId);
	
	// 채팅방을 나가면 삭제해준다.
	public void deleteRoom(String roomId, String name1, String name2);
	
	// 상대방의 채팅 이미지를 가지고 온다.
	public String searchProfile(String username);
	
	// 3일이 지난 메시지를 삭제해준다.
	public void deleteMessage();
}
