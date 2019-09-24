<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 채팅을 위한 라이브러리 추가 sockjs , stomp  -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.min.js"></script>

<link rel="stylesheet" href="/hos/resources/css/com_chatDetail.css" />
<script src="/hos/resources/js/com_chatDetail.js"></script>

<div class="chat_wrap">
	<input type="hidden" id="sender" value="${chatroom.name1}" />
	<input type="hidden" id="roomId" value="${chatroom.roomId}" />
	<div>
		<a href="/hos/comm/chat"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
		<span style="margin-left: 10px; font-size: 30px;">${chatroom.name2}</span>
		<a href="">
			<span style="margin-left: 370px; maring-top: 10px; font-size: 20px;"><i class="fa fa-sign-out" aria-hidden="true"></i>나가기</span>
		</a>
		<hr />
	</div>
	<div id="message_box">
		<ul>
			<c:forEach items="${messageList}" var="message">
				<c:choose>
					<c:when test="${message.sender eq sessionScope.memberInfo.username}">
						<li class="list-group-item me">
							<p>${message.sender}</p>
							<span>${message.time}</span><div class="alert alert-warning">
								${message.message}
							</div>
						</li>
					</c:when>
					<c:otherwise>
						<li class="list-group-item opponent">
							<p>${message.sender}</p>
							<div class="alert alert-light">
								${message.message}
							</div><span>${message.time}</span>
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