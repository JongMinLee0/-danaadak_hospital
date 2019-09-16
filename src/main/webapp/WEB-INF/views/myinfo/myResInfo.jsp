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
	text-align: center;
}

.resMessDetail{
	text-align : left;
}
</style>
</head>
<body>
<div class="myResInfoWrap">
<p><h3>진료 내역</h3></p>
<table class="myResTable">
	<thead>
	<tr>
		<th scope="col" class="rno" style="width:10%;"><span>예약 번호</span></th>
		<th scope="col" class="hosName" style="width:20%;"><span>병원이름</span></th>				
		<th scope="col" class="resCate" style="width:10%;"><span>진료항목</span></th>				
		<th scope="col" class="resDate" style="width:10%;"><span>예약일</span></th>
		<th scope="col" class="resTime" style="width:10%;"><span>예약 시간</span></th>
		<th scope="col" class="resState" style="width:10%;"><span>예약 상태</span></th>
		<th scope="col" class="resMess" style="width:30%;"><span>남기는 메시지</span></th>
		
	</tr>
	</thead>
	<tbody class="myResBody">
		<tr>
			<td class="rno">0003</td>
			<td class="hosName">MH치과</td>
			<td class="resCate">스케일링</td>
			<td class="resDate">2019-09-12</td>
			<td class="resTime">15:00</td>
			<td class="resState">예약</td>
			<td class="resMess resMessDetail">없음</td>
		</tr>
		<tr>
			<td class="rno">0002</td>
			<td class="hosName">진영내과</td>
			<td class="resCate">복통</td>
			<td class="resDate">2019-09-01</td>
			<td class="resTime">15:00</td>
			<td class="resState">진료완료</td>
			<td class="resMess resMessDetail">메세지 있다요. 배가 아프다요.</td>
		</tr>
		<tr>
			<td class="rno">0001</td>
			<td class="hosName">MH치과</td>
			<td class="resCate">충치치료</td>
			<td class="resDate">2019-08-12</td>
			<td class="resTime">15:00</td>
			<td class="resState">진료완료</td>
			<td class="resMess resMessDetail">없음</td>
		</tr>
			
	</tbody>
</table>
</body>
</html>