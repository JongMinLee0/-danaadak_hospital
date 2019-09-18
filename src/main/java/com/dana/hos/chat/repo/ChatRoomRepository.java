package com.dana.hos.chat.repo;

import java.util.List;

import org.springframework.data.redis.listener.ChannelTopic;

import com.dana.hos.chat.module.ChatRoom;

public interface ChatRoomRepository {

	// 초기화
	public void init();

	// 전체 채팅방 리스트
	public List<ChatRoom> findAllRoom();

	// 특정 id의 채팅방
	public ChatRoom findRoomById(String id);

	// 방 만들기
	public ChatRoom createChatRoom(String name);

	// 방 입장
	public void enterChatRoom(String roomId);

	public ChannelTopic getTopic(String roomId);
}
