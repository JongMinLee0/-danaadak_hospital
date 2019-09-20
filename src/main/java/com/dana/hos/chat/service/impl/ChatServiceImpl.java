package com.dana.hos.chat.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.chat.module.ChatList;
import com.dana.hos.chat.module.ChatMessage;
import com.dana.hos.chat.module.ChatRoom;
import com.dana.hos.chat.repo.ChatRoomRepository;
import com.dana.hos.chat.service.ChatService;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
	// 초기 채팅 리스트 입장시
	@Override
	public List<ChatList> chatList(String id) {
		// 아이디에 있는 모든 채팅방 정보를 가지고 온다. roomID 가 리스트로 저장되어 있다.
		List<Object> roomList = chatRoomRepository.roomList(id);
		List<ChatList> cList = new ArrayList<>();
		// 대상자를 확인해야 한다.
		// 해당하는 방 정보를 가지고 온다.
		for(Object obj : roomList) {
			ChatRoom chatRoom = chatRoomRepository.findRoomById((String)obj);
			ChatList chatList = new ChatList();
			
			// 대상자의 이름 저장
			String name = chatRoom.getName1().equals(id) ? chatRoom.getName2() : chatRoom.getName1();
			
			List<Object> roomMessage = chatRoomRepository.roomMessage((String)obj);
			
			chatList.setOpponent(name);
			if(roomMessage.size() > 0) {
				chatList.setMessage((ChatMessage) roomMessage.get(roomMessage.size()-1));
				// setLastMessage에 JSON형식으로 들어간다(즉, 메세지와 시간이 들어가 있을 것)
			}
			cList.add(chatList);
		}
		
		return cList;
	}

}
