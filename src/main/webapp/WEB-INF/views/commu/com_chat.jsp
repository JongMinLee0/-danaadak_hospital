<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/hos/resources/css/com_chat.css" />
<script src="/hos/resources/js/com_chat.js"></script>
<div class="chatList_wrap">
		<c:forEach items="${cList}" var="cdto">
			<a href="/hos/chat/room/enter?roomId=${cdto.roomId}&name1=${sessionScope.memberInfo.username}&name2=${cdto.opponent}">	
				<table class="chatList_table">
					<tr>
						<td>${cdto.opponent}<input type="hidden" class="roomNum" value="${cdto.roomId}" /></td>
						<td>${cdto.time}</td>
					</tr>
					<tr class="message_wrap">
						<td>${cdto.message}</td>
					</tr>
				</table>
			</a>
		</c:forEach>
</div>