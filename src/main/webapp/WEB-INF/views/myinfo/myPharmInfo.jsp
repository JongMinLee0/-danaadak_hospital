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
	$('#pharmDetailPage').on('click', function(){
		$('.myPharmInfoWrap').load('/hos/myinfo/myPharmDetail');
	});
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
		<th scope="col" class="rno" style="width:100px;"><span>예약 번호</span></th>
		<th scope="col" class="hosName" style="width:200px;"><span>발급병원</span></th>				
		<th scope="col" class="resDate" style="width:100px;"><span>발급날짜</span></th>				
		<th scope="col" class="pharmDetail" style="width:100px;"><span>상세</span></th>
	</tr>
	</thead>
	<tbody class="myPharmBody">
		<tr>
			<td class="rno">0002</td>
			<td class="hosName">진영내과</td>
			<td class="resDate">2019-09-01</td>
			<td class="pharmDetail" id="pharmDetailPage">확인</td>
		</tr>
	</tbody>
</table>
</div>
</body>
</html>