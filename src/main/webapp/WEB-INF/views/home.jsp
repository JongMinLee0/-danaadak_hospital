<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다나았닥</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/home.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="/hos/resources/js/home.js"></script>
</head>
<body>
<!-- navbar 홈페이지 상단 메뉴바  -->
 <tiles:insertAttribute name="navbar" />

<!-- 홈페이지 상단 메뉴바와 배경을 감싸는 부분  -->
<div class="home_image_wrap">
	<div class="home_des">
			<p class="des_comment_head"><strong>병원찾기</strong>부터</p>
			<p class="des_comment_head">웹에서 <strong>간편접수</strong>까지</p>
			<p class="des_comment">병원 가기 전에 다나았닥으로 접수해보세요.</p>
			<p class="des_comment">대기실에서 기다리는 시간이 줄어듭니다.</p>
			<p class="des_comment">커뮤니티를 통한 활동도 확인해보세요.</p>
			<button class="btn btn-primary" onclick="location.href='/hos/map'">병원접수하기</button>
		
	</div>
</div>

<!-- 배경이미지 하단 카드  -->
<div class="first-group">
  <div class="container" onclick="location.href='/hos/map?keyword=정형외과'">
  	<img src="/hos/resources/images/home/정형외과.jpg" alt="정형외과" class="image">
  	<div class="overlay">
    	<div class="text"><p>정 형</p><p>외 과</p></div>
  		</div>
  </div>
  <div class="container" onclick="location.href='/hos/map?keyword=내과'">
  	<img src="/hos/resources/images/home/내과.jpg" alt="내과" class="image">
  	<div class="overlay">
    	<div class="text">내 과</div>
  		</div>
  </div>
  <div class="container" onclick="location.href='/hos/map?keyword=안과'">
  	<img src="/hos/resources/images/home/안과.jpg" alt="안과" class="image">
  	<div class="overlay">
    	<div class="text">안 과</div>
  		</div>
  </div>
</div>
<div class="second-group">
  <div class="container" onclick="location.href='/hos/map?keyword=산부인과'">
  	<img src="/hos/resources/images/home/산부인과.jpg" alt="산부인과" class="image">
  	<div class="overlay">
    	<div class="text"><p>산 부</p><p>인 과</p></div>
  		</div>
  </div>
  <div class="container" onclick="location.href='/hos/map?keyword=치과'">
  	<img src="/hos/resources/images/home/치과2.jpg" alt="치과2" class="image">
  	<div class="overlay">
    	<div class="text">치 과</div>
  		</div>
  </div>
  <div class="container" onclick="location.href='/hos/map?keyword=피부과'">
  	<img src="/hos/resources/images/home/피부과.jpg" alt="피부과" class="image">
  	<div class="overlay">
    	<div class="text">피부과</div>
  		</div>
  </div>
</div>

<!-- 하단 footer  -->
<tiles:insertAttribute name="footer" />
</body>
</html>