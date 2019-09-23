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
import com.google.gson.Gson;
import com.google.gson.JsonObject;

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
			List<String> roomMessage = chatRoomRepository.roomMessage((String)obj);
			
			chatList.setOpponent(name);
			if(roomMessage.size() > 0) {
				// 마지막 메시지를 가지고 온다.
				String json = roomMessage.get(roomMessage.size()-1);
				JsonObject convertedObject = new Gson().fromJson(json, JsonObject.class);
				chatList.setMessage(convertedObject.get("message").getAsString());
				chatList.setTime(convertedObject.get("time").getAsString());
				// setLastMessage에 JSON형식으로 들어간다(즉, 메세지와 시간이 들어가 있을 것)
			}
			chatList.setRoomId((String)obj);
			cList.add(chatList);
		}
		
		return cList;
	}

	@Override
	public List<ChatMessage> messageList(String roomId) {
		// ChatMessage를 저장해 놓았다.
		List<ChatMessage> chatMessage = new ArrayList<>();
		List<String> stringList = chatRoomRepository.roomMessage(roomId);
		for(String str : stringList) {
			String json = str;
			JsonObject convertedObject = new Gson().fromJson(json, JsonObject.class);
			ChatMessage chat = new ChatMessage();
			
			chat.setMessage(convertedObject.get("message").toString().replaceAll("\"", ""));
			chat.setRoomId(convertedObject.get("roomId").toString().replaceAll("\"", ""));
			chat.setSender(convertedObject.get("sender").toString().replaceAll("\"", ""));
			chat.setTime(convertedObject.get("time").toString().replaceAll("\"", ""));
			chatMessage.add(chat);
		}
		
		return chatMessage;
	}

}
