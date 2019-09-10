<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/hos/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/hos/resources/css/comm_main.css" />
<script type="text/javascript" src="/hos/resources/js/comm_main.js"></script>
</head>
<body>
<!-- navbar 홈페이지 상단 메뉴바  -->
<tiles:insertAttribute name="navbar" />

<!-- 커뮤니티 바디  -->
<div class="comm_body">
	<!-- 커뮤니티 header -->
	<div class="comm_header">
		<ul class="comm_menu">
			<li><a href="/hos/comm/event">이벤트</a></li>
			<li><a href="/hos/comm/chat">1:1대화</a></li>
			<li><a href="/hos/comm/review">후기</a></li>
		</ul>
	</div>
	
	<div class="content_wrap">
		<tiles:insertAttribute name="mainbody" />
	</div>
	
	
</div>


<!-- 하단 footer -->
<tiles:insertAttribute name="footer" />
</body>
</html>