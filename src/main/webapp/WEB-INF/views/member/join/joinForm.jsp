<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="/hos/resources/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/hos/resources/js/join.js"></script>
<link rel="stylesheet" href="/hos/resources/css/join.css" />

</head>

<body id="register">
	<jsp:include page="/WEB-INF/views/fragments/nav_bar.jsp"/>

	<div class="wrapper">
		<!-- Main -->
		<div class="about-bottom main-agile book-form">
			<h2 class="tittle">Register Here</h2>
			<form action="#" method="post">
				<div class="form-date-w3-agileits">
					<label> ID </label> 
					<input type="text" name="name" placeholder="Your Name" required=""> 
					<label> Password </label> 
					<input type="password" name="password" placeholder="Your Password" required="">
					<label> CONFIRM Password </label>
					<input type="password" name="password" placeholder="Confirm Password" required="">
					<label> Address</label> 
					<div id="address">
						<input type="text" id="postcode" placeholder="우편번호">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="roadAddress" placeholder="도로명주소">
						<input type="text" id="jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="detailAddress" placeholder="상세주소">
					</div>
				</div>
				<div class="btn">
					<input type="submit" value="Register">
				</div>
			</form>
		</div>
		<!-- //Main -->
	</div>
</body>
</html>