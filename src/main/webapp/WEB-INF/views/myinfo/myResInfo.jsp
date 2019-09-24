<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $('#resCancelBtn').on('click', function() {
	  if (confirm("정말 취소하시겠습니까?") == true){    //확인
      	document.form.submit();
 	 } else {   //취소
      	return false;
  	} 
  });
});
</script>
<style type="text/css">
.myResInfoWrap{
	text-align:-webkit-center;
}

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

</head>
<body>
<div class="myResInfoWrap">
<p><h3>진료 내역</h3></p>
<form id ="frm" name="frm" action="/hos/myinfo/myresCancel" method="post">
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
			<c:if test="${myres[status.index].hos_id == null}">
				<input type="hidden">
			</c:if>
			<c:if test="${myres[status.index].hos_id != null}">
			<td class="hosName">${myres[status.index].hosDTO.hos_name}</td>
			<td class="resCate">${myres[status.index].category}</td>
			<td class="resDate">${myres[status.index].re_date}</td>
			<td class="resTime">${myres[status.index].re_time}</td>
			<td class="resState resStateTd">
			<c:if test="${myres[status.index].re_state == 0}">
			예약 중
			</c:if>
			<c:if test="${myres[status.index].re_state == 1}">
			진료 완료
			</c:if>
			<c:if test="${myres[status.index].re_state == 2}">
			예약 취소
			</c:if></td>
			<td class="resMess resMessDetail">${myres[status.index].message}</td>
			<td class="resReview ">
			<input type ="hidden" value="${myres[status.index].hosDTO.hos_name}" name="hos_name" />
			<input type ="hidden" value="${myres[status.index].category}" name="category" />
			<input type ="hidden" value="${myres[status.index].re_date}" name="re_date" />
			<input type ="hidden" value="${myres[status.index].re_time}" name="re_time" />
			<input type ="hidden" value="${myres[status.index].re_state}" name="re_state" />
			<input type ="hidden" value="${myres[status.index].message}" name="message" />
			<input type ="hidden" value="${sessionScope.memberInfo.username}" name="username" />
			<c:if test="${myres[status.index].re_state == 0}">
			<input type ="submit" class="resCancelBtn" value="예약 취소" />
			</c:if>
			<c:if test="${myres[status.index].re_state == 1}">
			<input type ="submit" class="resReviewBtn" value="후기 작성" />
			</c:if>
			</td>
			</c:if>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
</div>
</body>
</html>