<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
.myResTable{
	width:70%;
	text-align: center;
}

td{
	height: 50px;
}

.resMessDetail{
	text-align : left;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
/* // 	$('.resStateTd').each(function(index, myres) {
		if($('.resStateDetail').val() == '0') {
			$('.resStateTd').append('예약 중0');
			$('.resCancelBtn').attr("type","button");
		} else if($('.resStateDetail').val() == '1') {
			$('.resStateTd').append('완료133');
			$('.resReviewBtn').attr("type","button");
		} 
		return null;
		
// 		$('resStateDetail').val() = null;
// 	}); */
});
</script>
</head>
<body>
<div class="myResInfoWrap">
<p><h3>진료 내역</h3></p>
<table class="myResTable">
	<thead>
	<tr>
		<th scope="col" class="hosName" style="width:15%;"><span>병원이름</span></th>				
		<th scope="col" class="resCate" style="width:10%;"><span>진료항목</span></th>				
		<th scope="col" class="resDate" style="width:10%;"><span>예약일</span></th>
		<th scope="col" class="resTime" style="width:10%;"><span>예약 시간</span></th>
		<th scope="col" class="resState" style="width:10%;"><span>예약 상태</span></th>
		<th scope="col" class="resMess" style="width:25%;"><span>남기는 메시지</span></th>
		<th scope="col" class="resReview" style="width:10%;"><span>후기 작성</span></th>
		
	</tr>
	</thead>
	<tbody class="myResBody">
	<c:forEach var="myresList" items="${myres}" varStatus="status">
		<tr>
			<td class="hosName">${myres[status.index].hos_id}</td>
			<td class="resCate">${myres[status.index].category}</td>
			<td class="resDate">${myres[status.index].re_date}</td>
			<td class="resTime">${myres[status.index].re_time}</td>
			<td class="resState resStateTd">
			<c:if test="${myres[status.index].re_state == 1}">
			예약 중
			</c:if>
			<c:if test="${myres[status.index].re_state == 0}">
			완료
			</c:if></td>
			<td class="resMess resMessDetail">${myres[status.index].message}</td>
			<td class="resReview ">
			<c:if test="${myres[status.index].re_state == 1}">
			<input type ="button" class="resCancelBtn" value="예약 취소" />
			</c:if>
			<c:if test="${myres[status.index].re_state == 0}">
			<input type ="button" class="resReviewBtn" value="후기 작성" />
			</c:if></td>
		</tr>
	</c:forEach>
		<tr>
			<td class="hosName">진영내과</td>
			<td class="resCate">복통</td>
			<td class="resDate">2019-09-01</td>
			<td class="resTime">15:00</td>
			<td class="resState">진료완료</td>
			<td class="resMess resMessDetail">메세지 있다요. 배가 아프다요.</td>
			<td class="resReview "><input type ="button" class="resReviewBtn" value="후기 작성" /></td>
		</tr>
		<tr>
			<td class="hosName">MH치과</td>
			<td class="resCate">충치치료</td>
			<td class="resDate">2019-08-12</td>
			<td class="resTime">15:00</td>
			<td class="resState">진료완료</td>
			<td class="resMess resMessDetail">없음</td>
			<td class="resReview "><input type ="button" class="resReviewBtn" value="후기 작성" /></td>
		</tr>
		<%-- <h2><input type="text" value="${myres[0].hos_id}" name="hos_id"/></h2>
		 --%>
			
	</tbody>
</table>
</body>
</html>