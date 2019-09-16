<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
.myPharmDetailTable{
	text-align: center;
}
</style>
</head>
<body>
<div class="myPharmDetailWrap">
<p><h3>처방전 상세</h3></p>
<table class="myPharmDetailTable">
	<thead>
	<tr>
		<th scope="col" class="pharmName" style="width:200px;"><span>약 이름</span></th>
		<th scope="col" class="pharmQuan" style="width:100px;"><span>1회 복용량</span></th>
		<th scope="col" class="pharmCount" style="width:100px;"><span>1일 복용횟수</span></th>
		<th scope="col" class="pharmInfo" style="width:400px;"><span>약 정보</span></th>
	</tr>
	</thead>
	<tbody class="myPharmDetailBody">
	  <tr>
		<td class="pharmName">배안아파</td>
		<td class="pharmQuan">1정</td>
		<td class="pharmCount">식후 3회</td>
		<td class="pharmInfo">소화불량, 위산과다, 가슴 답답함</td>
	  </tr>
	  <tr>
		<td class="pharmName">염증노노</td>
		<td class="pharmQuan">1정</td>
		<td class="pharmCount">식후 3회</td>
		<td class="pharmInfo">소염</td>
	  </tr>
	  
	</tbody>
</table>
</div>
</body>
</html>