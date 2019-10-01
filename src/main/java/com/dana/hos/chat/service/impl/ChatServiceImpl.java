package com.dana.hos.chat.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.joda.time.DateTime;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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

	@Autowired
	private SqlSession sqlSession;

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
				String text = chatMessage.getMessage();
				if (text.length() > 15) {
					text = text.substring(0, 15) + "...";
				}
				chatList.setMessage(text);
				chatList.setTime(chatMessage.getTime());
				// setLastMessage에 JSON형식으로 들어간다(즉, 메세지와 시간이 들어가 있을 것)
			} else {
				chatList.setMessage("새로 생성된 대화입니다!!");
			}
			chatList.setRoomId(str.getRoomId());
			String profile_image = sqlSession.selectOne("searchProfile", opponent);
			chatList.setProfile_image(profile_image);
			cList.add(chatList);
		}
		List<ChatList> resultList = new ArrayList<>();
		// 최종 결과를 날짜별로 정렬해서 가져다 준다.
		if (cList.size() > 0) {
			Collections.sort(cList, new Comparator<ChatList>() {
				public int compare(ChatList o1, ChatList o2) {
					if (o1.getTime() == null || o2.getTime() == null)
						return 0;
					return o1.getTime().compareTo(o2.getTime());
				}
			});
			for (int i = cList.size() - 1; i >= 0; i--) {
				resultList.add(cList.get(i));
			}
		}
		return resultList;
	}

	// 방들어갈때 메시지를 뿌려준다.
	@Override
	public List<ChatMessage> messageList(String roomId) {
		// ChatMessage를 저장해 놓았다.
		List<ChatMessage> chatMessage = chatRoomRepository.roomMessage(roomId);
		List<ChatMessage> tempList = new ArrayList<>();

		// 시간별로 정렬해준다.
		Collections.sort(chatMessage, new Comparator<ChatMessage>() {
			public int compare(ChatMessage o1, ChatMessage o2) {
				if (o1.getTime() == null || o2.getTime() == null)
					return 0;
				return o1.getTime().compareTo(o2.getTime());
			}
		});

		for (ChatMessage chat : chatMessage) {

			// 시간을 : 형태로 잘라준다.
			String temp = chat.getTime().substring(11, 17);
			String[] strArray = temp.split("시");
			String resultTime = strArray[0] + ":" + strArray[1];

			// 전체를 객체에 담아 넘겨준다.
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

	// 상대방의 profile_image를 출력해준다.
	@Override
	public String searchProfile(String username) {
		return sqlSession.selectOne("searchProfile", username);
	}

	// 3일이 지난 메시지를 지워준다.
	// 매일 새벽 2시 실행
	@Override
	@Scheduled(cron = "0 0 02 * * ?")
	public void deleteMessage() {
		// 3일 전의 시간이 mTime에 저장된다. 이것보다 작으면 지워버리면 된다.
		String mTime = LocalDateTime.now().minusDays(3).toString("yyyy년MM월dd일 HH시mm분ss초");
		Set<String> allKey = chatRoomRepository.allKeys();
		// 키를 다 받아온다.
		// 여기서 roomId만 해서 roomId를 List에 옮겨 담는다.
		List<String> keyList = new ArrayList<String>(allKey);
		List<String> roomList = new ArrayList<String>();
		for (int i = 0; i < keyList.size(); i++) {
			if (keyList.get(i).length() > 25) {
				roomList.add(keyList.get(i));
			}
		}

		// 채팅 내용을 다 가지고 온다.
		for (int i = 0; i < roomList.size(); i++) {
			// ChatMessage를 저장해 놓았다.
			String roomId = roomList.get(i);
			// 모든 메시지 정보가 들어 있다.
			List<ChatMessage> chatMessage = chatRoomRepository.roomMessage(roomId);

			for (int k = 0; k < chatMessage.size(); k++) {
				String chatTime = chatMessage.get(i).getTime();
				System.out.println(compareTime(mTime, chatTime));
				if (compareTime(mTime, chatTime) <= -5) {
					System.out.println("삭제 됫다....");
					chatRoomRepository.deleteMessage(roomId, chatTime);
				}
			}
		}
	}

	// 시간을 비교해준다.
	public int compareTime(String mtime, String chatTime) {
		if (mtime == null || chatTime == null)
			return 0;
		return mtime.compareTo(chatTime);
	}

}