package com.dana.hos.chat.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatRoomRepository chatRoomRepository;

	// 초기 채팅 리스트 입장시
	@Override
	public List<ChatList> chatList(String username) {

		// 아이디에 있는 모든 채팅방 정보를 가지고 온다. roomID 가 리스트로 저장되어 있다.
		List<ChatRoom> roomList = chatRoomRepository.roomList(username);

		List<ChatList> cList = new ArrayList<>();
		// 대상자를 확인해야 한다.
		// 해당하는 방 정보를 가지고 온다.
		for (ChatRoom str : roomList) {
			ChatRoom chatRoom = chatRoomRepository.findRoomById(username, str.getRoomId());
			ChatList chatList = new ChatList();
			List<ChatMessage> roomMessage = chatRoomRepository.roomMessage(str.getRoomId());
			String opponent = username.equals(chatRoom.getName1()) ? chatRoom.getName2() : chatRoom.getName1();
			chatList.setOpponent(opponent);
			if (roomMessage.size() > 0) {
				// 마지막 메시지를 가지고 온다.
				// 이거 큰일났다..날짜로 비교해야되는데...어케 비교하지?..
				Collections.sort(roomMessage, new Comparator<ChatMessage>() {
					  public int compare(ChatMessage o1, ChatMessage o2) {
					      if (o1.getTime() == null || o2.getTime() == null)
					        return 0;
					      return o1.getTime().compareTo(o2.getTime());
					  }
				});
				ChatMessage chatMessage = roomMessage.get(roomMessage.size() - 1);
				chatList.setMessage(chatMessage.getMessage());
				chatList.setTime(chatMessage.getTime());
				// setLastMessage에 JSON형식으로 들어간다(즉, 메세지와 시간이 들어가 있을 것)
			}
			chatList.setRoomId(str.getRoomId());
			cList.add(chatList);
		}

		return cList;
	}

	@Override
	public List<ChatMessage> messageList(String roomId) {
		// ChatMessage를 저장해 놓았다.
		List<ChatMessage> chatMessage = chatRoomRepository.roomMessage(roomId);
		List<ChatMessage> tempList = new ArrayList<>();
		Collections.sort(chatMessage, new Comparator<ChatMessage>() {
			  public int compare(ChatMessage o1, ChatMessage o2) {
			      if (o1.getTime() == null || o2.getTime() == null)
			        return 0;
			      return o1.getTime().compareTo(o2.getTime());
			  }
		});

		for (ChatMessage chat : chatMessage) {
			String temp = chat.getTime().substring(11, 17);
			String[] strArray = temp.split("시");
			String resultTime = strArray[0] + ":" + strArray[1];

			ChatMessage chatme = new ChatMessage();
			chatme.setTime(resultTime);
			chatme.setRoomId(chat.getRoomId());
			chatme.setSender(chat.getSender());
			chatme.setType(chat.getType());
			chatme.setMessage(chat.getMessage());
			tempList.add(chatme);
		}

		return tempList;
	}

	// 채팅방을 삭제해준다.
	@Override
	public void deleteRoom(String roomId, String name1, String name2) {
		chatRoomRepository.exitRoom(roomId, name1, name2);
	}

}