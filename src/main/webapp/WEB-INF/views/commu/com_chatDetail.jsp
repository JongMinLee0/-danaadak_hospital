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
		<a href=""><i class="fa fa-angle-left" aria-hidden="true"></i></a>
		<span>${chatroom.name2}</span>
		<hr />
	</div>
	<div id="message_box">
		<ul>
			<c:forEach items="${messageList}" var="message">
				<li>
					<p>${message.sender}<span>${message.time}</span></p>
					<p>${message.message}</p>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div>
		<textarea class="form-control" rows="5" id="comment" name="message"></textarea>
		<button id="sendBtn" onclick='sendMessage()'>전송</button>
	</div>
</div>