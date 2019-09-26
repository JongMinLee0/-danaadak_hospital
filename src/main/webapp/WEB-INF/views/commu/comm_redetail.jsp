<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/hos/resources/css/com_redetail.css" />
<script src="/hos/resources/js/comm_redetail.js"></script>
<div class="detail_wrap">
	<table class="detail_table">
			<tr>
				<td>${dList.vi_subject}
				<hr /></td>
				<td style="text-align: right;">${dList.vi_date}
				<hr /></td>
			</tr>
			<tr>
				<td><h4>${dList.username}</h4></td>
				<c:choose>
					<c:when test="${sessionScope.memberInfo.username eq dList.username}">
						<td style="text-align: right;">
							<button id="modifyBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
					</c:when>
					<c:otherwise>
						<td style="text-align: right;"><button name="username" id="username" value="${dList.username}">1:1대화</button></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>${dList.vi_hash}
						<span style="color: orange">
							<c:forEach var="i" begin="1" end="${dList.vi_star}" step="1">
								★
							</c:forEach></span>
							<br /><br /><br /><br />
				</td>
			</tr>
			<tr>
				<td colspan="2">${dList.vi_content}</td>
			</tr>
	</table>
</div>
<div class="comment_wrap">
	<span>댓글:</span>
	<form method="post" id="frm">
		<input type="hidden" id="vino" name="vino" value="${dList.vino}" />
		<input type="hidden" id="name" name="name" value="${sessionScope.memberInfo.name}" />
		<input type="hidden" id="userId" name="userId" value="${sessionScope.memberInfo.username}" />
		<textarea class="form-control" rows="5" id="comment" name="com_content" placeholder="댓글을 작성해주세요."></textarea>
		<input type="submit" value="작성" id="subBtn">
		<input type="button" value="뒤로" id="backBtn">
	</form>
	<hr />
	<table class="comment_table">
	<c:forEach items="${cList}" var="cdto">
		<tr>
			<td style="font-weight: bold"><hr>${cdto.name}</td>
			<td><hr>${cdto.com_date}</td>
			<c:choose>
					<c:when test="${sessionScope.memberInfo.name eq cdto.name}">
						<td style="text-align: right;">
							<hr />
							<a href="">수정</a>
							<a href="">삭제</a>
							<input type="hidden" name="cno" value="${cdto.cno}" />
						</td>
					</c:when>
			</c:choose>
		</tr>
		<tr>
			<td colspan="2">${cdto.com_content}<br /><br /></td>
		</tr>
	</c:forEach>
	</table>
	
</div>