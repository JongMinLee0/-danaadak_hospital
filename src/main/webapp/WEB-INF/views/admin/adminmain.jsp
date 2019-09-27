<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/hos/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/hos/resources/css/admin_main.css" />
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/hos/resources/js/admin_main.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- navbar 홈페이지 상단 메뉴바  -->
<tiles:insertAttribute name="navbar" />

	<div class="admin_body">
	<!-- 관리자 페이지 header -->
	<div class="admin_header">
		<ul class="admin_menu">
			<li><a href="/hos/admin/hos_joinmanagement">병원 가입 관리</a></li>
			<li><a href="/hos/admin/admin_event_list">병원 이벤트 관리</a></li>
		</ul>
	</div>
	
	<!-- 관리자 페이지 body -->
	<div class="no_wrap">
		<tiles:insertAttribute name="admin_body" />
	</div>
	
	
</div>
	
	<!-- 하단 footer -->
<tiles:insertAttribute name="footer" />
</body>
</html>