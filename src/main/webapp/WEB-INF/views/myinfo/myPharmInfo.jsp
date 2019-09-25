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

});
</script>
<style type="text/css">
.myPharmTable{
	text-align: center;
}
</style>
</head>
<body>
<div class="myPharmInfoWrap">
<p><h3>처방전 내역 </h3></p>
<table class="myPharmTable">
	<thead>
	<tr>
		<th scope="col" class="hosName" style="width:200px;"><span>발급병원</span></th>				
		<th scope="col" class="resDate" style="width:100px;"><span>발급날짜</span></th>				
		<th scope="col" class="pharmName" style="width:100px;"><span>약 이름</span></th>
		<th scope="col" class="pharmQuan" style="width:100px;"><span>1회 복용량</span></th>
		<th scope="col" class="pharmCount" style="width:100px;"><span>1일 복용횟수</span></th>
	</tr>
	</thead>
	<tbody class="myPharmBody">
	<c:forEach var="myPharmList" items="${myres}" varStatus="status">
		<tr class="myPharmLine" id="${myPharmList.rno}" value="${myPharmList.rno}">
			<c:if test="${myres[status.index].medicine == null}">
<!-- 				<input type="hidden"> -->
			</c:if>
			
			<c:if test="${myres[status.index].medicine != null}">
				<td class="hosName">${myres[status.index].hosDTO.hos_name}</td>
				<td class="resDate">${myres[status.index].re_date}</td>
				<td class="pharmName">${myres[status.index].medicine}</td>
				<td class="pharmQuan">${myres[status.index].eat_cnt}</td>
				<td class="pharmCountn">${myres[status.index].eat_cnt}</td>
			</c:if>
			</tr>
	</c:forEach>		
	</tbody>
</table>
</div>
</body>
</html>