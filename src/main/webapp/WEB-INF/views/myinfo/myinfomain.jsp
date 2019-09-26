<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/myinfomain.css" />
<script type="text/javascript" src="/hos/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<script type="text/javascript">
//마이페이지 메인

//마이페이지 섹션
$(document).ready(function() {
/* 	$('#memberInfo').on('click', function() {
		$('#myInfocontent').load('/hos/myinfo/memInfo');
	});
 */
/* 	$('#resMore').on('click', function() {
		$('#myInfocontent').load('/hos/myinfo/myResInfo');
	}); */
	$('#nav_reserList').on('click', function() {
		$('#myInfocontent').load('/hos/myinfo/myResInfo');
	});
// 	$('#pharmMore').on('click', function() {
// 		$('#myInfocontent').load('/hos/myinfo/myPharmInfo');
// 	});
// 	$('#nav_pharmList').on('click', function() {
// 		$('#myInfocontent').load('/hos/myinfo/myPharmInfo');
// 	});
// 	$('#pharmDetail').on('click', function() {
// 		$('#myInfocontent').load('/hos/myinfo/myPharmInfo');
// 	});
// 	$('#myrevbtn').on('click', function() {
// 		$('#myInfocontent').load('/hos/myinfo/myReview');
// 	});
// 	$('#nav_reviewList').on('click', function() {
// 		$('#myInfocontent').load('/hos/myinfo/myReview');
// 	});
	
		$('body > div.navbar_wrap.fixed-top').removeClass('fixed-top');
	
	
	
});
</script>

</head>
<body>
<!-- navbar 홈페이지 상단 메뉴바  -->
<tiles:insertAttribute name="navbar" />

<div class="myinfomainDiv" id="container">
  <!-- 네비게이션 바 -->
  <ul class="nav nav-tabs">
		<li class="active" id="nav_memInfo">
			<a href="/hos/myinfo/memInfo"><p>회원정보수정</p></a>
		</li><li class="active" id="nav_reserList">
			<a href="/hos/myinfo/myResInfo"><p>진료 내역</p></a>
		</li><li class="active" id="nav_pharmList">
			<a href="/hos/myinfo/myPharmInfo"><p>처방전 내역</p></a>
		</li><li class="active" id="nav_reviewList">
			<a href="/hos/myinfo/myReview"><p>내 병원 후기</p></a>
		</li>
	</ul>
  
  
  <!-- CONTENTS -->
	<div id="myInfocontent" class="section_home">
	<div class="column">
		<input type="hidden" value="${sessionScope.memberInfo.username}" name="username"/>
		
		<!-- 회원정보 수정 -->
		<div class="sh_group">
			<span class="myinfoTitle">회원정보 수정</span>
			<p>이름  &nbsp;&nbsp;  ${sessionScope.memberInfo.name} &nbsp;&nbsp; <a href="/hos/myinfo/memInfo"><input type="button" id="memberInfo" value="정보 수정"/></a></p>
		</div>

		<!-- 처방전 내역 -->
		<div class="sh_group" id="pharmDiv">
			<span id="pharmList"><span class="myinfoTitle">처방전 내역</span><span style="color:gray;" id="pharmMore"><a href="/hos/myinfo/myPharmInfo"> &nbsp; &nbsp;더보기</a></span></span>
			<table id="pharmTable" style="width:100%;">
			<!-- <p>복용중이면 발급일, 병원명 띄워줌, 없으면  이력확인 링크</p> -->
			<tr align="center">
				<th>발급병원</th>
				<th>발급날짜</th>
			</tr>
			<c:forEach var="myresList" items="${myres}" varStatus="status" begin="0" end="3">
			<tr align="center">
				<c:if test="${myres[status.index].medicine == null}">
				<input type="hidden" >
				</c:if>
				<c:if test="${myres[status.index].medicine != null}">				
				<td>${myres[status.index].hosDTO.hos_name}</td>
				<td>${myres[status.index].re_date}</td>
				</c:if>
			</tr>
			</c:forEach>
			</table>
		</div>
	</div>	
		
		<!-- 진료 내역 -->
	<div class="column">
		<div class="sh_group" id="resDiv">
			<!-- <form action="/hos/myinfo/myResInfo" method="get"> -->
			<span id="resList"><span class="myinfoTitle">진료 내역</span><span style="color:gray;" id="resMore"><a href="/hos/myinfo/myResInfo"> &nbsp; &nbsp;더보기</a></span></span>
			
			<table id="resTable" style="width:100%;">
			<!-- <p>예약중이면 정보 띄워줌, 없으면 진료 완료 마지막거 띄워줌(병원 이름, 날짜, 시간) + 이력확인 링크</p> -->
			<tr align="center">
				<th>병원명</th>
				<th>날짜</th>
				<th>시간</th>
			</tr>
			<c:forEach var="myresList" items="${myres}" varStatus="status" begin="0" end="3">
				<tr align="center">
				<c:if test="${myres[status.index].hos_id == null}">
				<input type="hidden" >
				</c:if>
				<c:if test="${myres[status.index].hos_id != null}">
						<td>${myres[status.index].hosDTO.hos_name}</td>
						<td>${myres[status.index].re_date}</td>
						<td>${myres[status.index].re_time}</td>
				</c:if>
				</tr>
			</c:forEach>
	
			</table>
			<!-- </form> -->
		</div>
		
		<!-- 내 병원 후기 -->
		<div class="sh_group" id="myrevDiv">
			<span id="myRevList"><span class="myinfoTitle">내 병원 후기</span></span>
			
			<p><br/><br/><a href="/hos/myinfo/myReview"><input type="button" id="myrevbtn" value="내 후기 보기"/></a></p>
		</div>
	</div>
	</div>
</div>
<tiles:insertAttribute name="footer" />	
</body>
</html>