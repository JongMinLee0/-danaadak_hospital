<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 채팅을 위한 라이브러리 추가 sockjs , stomp  -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/com_chat.css" />
<script src="/hos/resources/js/com_chat.js"></script>
<div class="chatList_wrap">
		<input type="hidden" id="userId" value="${sessionScope.memberInfo.username}" />
		<c:forEach items="${cList}" var="cdto">
			<a class="${cdto.roomId}"href="/hos/chat/room/enter?roomId=${cdto.roomId}&name1=${sessionScope.memberInfo.username}&name2=${cdto.opponent}">	
				<table class="table">
					<thead class="thead-light">
						<tr colspan="2">
							<th>
							<img class="rounded-circle" src="${cdto.profile_image}" />
							${cdto.opponent}<input type="hidden" class="roomNum" value="${cdto.roomId}" /></th>
						</tr>
					</thead>
					<tbody>
						<tr class="message_wrap">
							<td id="${cdto.roomId}"><xmp style="overflow: hidden; font-size:17px; margin:0;">${cdto.message}</xmp></td>
							<td>${cdto.time}</td>
						</tr>
					</tbody>
				</table>
			</a>
		</c:forEach>
</div>