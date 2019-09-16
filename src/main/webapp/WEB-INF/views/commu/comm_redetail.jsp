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
				<td><h4>${dList.name}</h4></td><td style="text-align: right;"><button>1:1대화</button></td>
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
	<form method="post" action="/hos/comm/writeCom" id="frm">
		<input type="hidden" id="vino" name="vino" value="${dList.vino}" />
		<textarea class="form-control" rows="5" id="comment" name="com_content"></textarea>
		<input type="submit" value="작성" id="subBtn">
		<input type="button" value="뒤로" id="backBtn">
	</form>
	<hr />
	<table class="comment_table">
	<c:forEach items="${cList}" var="cdto">
		<tr>
			<td><hr /><h5>${cdto.name}</h5></td>
			<td><hr />${cdto.com_date}</td>
		</tr>
		<tr>
			<td colspan="2">${cdto.com_content}<br /><br /></td>
		</tr>
	</c:forEach>
	</table>
	
</div>