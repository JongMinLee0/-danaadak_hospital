package com.dana.hos.chat.service;

import java.util.List;

import com.dana.hos.chat.module.ChatList;

public interface ChatService {

	// 초기 채팅 리스트 입장시
	public List<ChatList> chatList(String id);
	
}
