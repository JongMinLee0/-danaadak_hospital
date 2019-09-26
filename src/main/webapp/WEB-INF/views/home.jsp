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
<!-- 애니메이션 -->
<link rel="stylesheet" href="resources/css/animate.css">
<script type="text/javascript" src="/hos/resources/js/wow.min.js"></script>
<script> new WOW().init(); </script>
</head>
<body>
<!-- navbar 홈페이지 상단 메뉴바  -->
 <tiles:insertAttribute name="navbar" />

<!-- 홈페이지 상단 메뉴바와 배경을 감싸는 부분  -->
<div class="home_image_wrap">
	<div class="wow fadeInDown home_des">
			<p class="des_comment_head"><strong>병원찾기</strong>부터</p>
			<p class="des_comment_head">웹에서 <strong>간편접수</strong>까지</p>
			<p class="des_comment">병원 가기 전에 다나았닥으로 접수해보세요.</p>
			<p class="des_comment">대기실에서 기다리는 시간이 줄어듭니다.</p>
			<p class="des_comment">커뮤니티를 통한 활동도 확인해보세요.</p>
			<button class="btn btn-dark" onclick="location.href='/hos/map'">병원접수하기</button>
		
	</div>
</div>
<!-- 진료과목 바로가기 -->
<div class="wrap">
	<p class="wow fadeInLeft" id="wraptext">진료과목 바로가기</p>
	<ol class="wow fadeInUpBig odd">
		<a href="/hos/map?keyword=정형외과">
		    <li class='hex' id="red">
		    	<div class="hex-content">정형외과</div>
		    </li>
	    </a>
	    <a href="/hos/map?keyword=내과">
	    <li class='hex' id="orange">
	    	<div class="hex-content">내과</div>
	    </li>
	    </a>
	    <a href="/hos/map?keyword=치과">
	    <li class='hex' id="yellow">
	    	<div class="hex-content">치과</div>
	    </li>
	    </a>
	    <a href="/hos/map?keyword=안과">
	    <li class='hex' id="green">
	    	<div class="hex-content">안과</div>
	    </li>
	    </a>
	</ol>  
	<ol class="wow fadeInUpBig even">
	<a href="/hos/map?keyword=산부인과">
	    <li class='hex' id="pink">
	    	<div class="hex-content">산부인과</div>
	    </li>
	    </a>
	    <a href="/hos/map?keyword=소아청소년과">
	    <li class='hex' id="purple">
	    	<div class="hex-content">소아청소년과</div>
	    </li>
	    </a>
	    <a href="/hos/map?keyword=성형외과">
	    <li class='hex' id="blue">
	    	<div class="hex-content">성형외과</div>
	    </li>
	    </a>
	</ol>
</div> 

<!-- 하단 footer  -->
<tiles:insertAttribute name="footer" />
</body>

</html>