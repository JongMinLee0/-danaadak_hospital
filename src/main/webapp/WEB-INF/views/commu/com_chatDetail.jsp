<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 채팅을 위한 라이브러리 추가 sockjs , stomp  -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.min.js"></script>

<link rel="stylesheet" href="/hos/resources/css/com_chatDetail.css" />
<script src="/hos/resources/js/com_chatDetail.js"></script>
<img src="/hos/resources/images/chatdetail_img.jpg" alt="채팅이미지" />
<div class="chat_wrap">
	<input type="hidden" id="sender" value="${chatroom.name1}" />
	<form id="frm" action="/hos/chat/exit" method="post">
		<input type="hidden" name="name1" value="${chatroom.name1}"/>
		<input type="hidden" id="reciver" name="name2" value="${chatroom.name2}"/>
		<input type="hidden" id="roomId" name="roomId" value="${chatroom.roomId}"/>
	</form>
		<input type="hidden" id="profile_image" name="profile_image" value="${sessionScope.memberInfo.profile_image}" />
	<div class="card border-secondary mb-3">
		<div class="card-header">
			<a href="/hos/comm/chat"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
				<span>${chatroom.name2}</span>
			<a href="">
				<span style="margin-left: 600px; maring-top: 10px; font-size: 20px;"><i class="fa fa-sign-out" aria-hidden="true"></i>나가기</span>
			</a>
		</div>
	</div>
	<div id="message_box">
		<ul>
			<c:forEach items="${messageList}" var="message">
				<c:choose>
					<c:when test="${message.sender eq sessionScope.memberInfo.username}">
						<li class="list-group-item me">
							<p>${message.sender}<img src="${sessionScope.memberInfo.profile_image}" class="rounded-circle" /></p>
							<span>${message.time}</span>
							  <div style="width: 100px; word-wrap:break-word">
							  <pre style="font-size: 17px; font-weight: bold;width: 100px; height: 100%; overflow: auto; display: contents;
							  white-space:pre-wrap;"><c:out value="${message.message}" /></pre></div>
							
						</li>
					</c:when>
					<c:otherwise>
						<li class="list-group-item opponent">
							<p><img src="${profile_image}" class="rounded-circle" />${message.sender}</p>
							<div style="width: 100px; word-wrap:break-word">
							  <pre style="font-size: 17px; font-weight: bold; color: brown;width: 100px; height: 100%; overflow: auto; display: contents;
							  white-space:pre-wrap;"><c:out value="${message.message}" /></pre></div><span>${message.time}</span>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</div>
	<div>
		<textarea class="form-control" rows="5" id="comment" name="message"></textarea>
		<button id="sendBtn" onclick='sendMessage()'>전송</button>
	</div>
</div>