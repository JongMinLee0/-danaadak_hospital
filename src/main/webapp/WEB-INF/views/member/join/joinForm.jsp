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
<link rel="stylesheet" href="/hos/resources/css/join.css" />
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/6.6.1/firebase-app.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/hos/resources/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/hos/resources/js/join.js"></script>

<script type="text/javascript">
	history.replaceState({}, null, location.pathname);
</script>

</head>

<body id="register">
	<jsp:include page="/WEB-INF/views/fragments/nav_bar.jsp"/>
	
	<div class="wrapper">
		<!-- Main -->
		<div class="header">
			<h1>회원가입</h1>
		</div>
		
		<div class="about-bottom main-agile book-form">
			<form action="/hos/join/join" method="post">
				<div class="form-date-w3-agileits">
					<input type="hidden" id="kakao_id" name="kakao_id" value="${param.kakao_id }">
					<label> ID </label> 
					<input type="text" id="username" name="username" placeholder="Your ID" required="" value="${param.id }"> 
					<label> Password </label> 
					<input type="password" id="password" name="password" placeholder="Your Password" required="" >
					<input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="Confirm Password" required="">
					<label> Name </label>
					<input type="text" id="name" name="name" placeholder="Your Name" required="" value="${param.name }" >
					<label> Address</label> 
					<div id="address">
						<input type="text" name="address" id="postcode" placeholder="우편번호" class="address_form mini" onclick="execDaumPostcode()">
						<input type="button" onclick="execDaumPostcode()" class="address_form mini" value="우편번호 찾기"><br>
						<input type="text" name="address" id="roadAddress" placeholder="도로명주소">
						<input type="text" name="address" id="detailAddress" placeholder="상세주소">
					</div>
					<label> Gender</label> 
					<div>
						<input type="radio" name="gender" value="0" checked="checked" >남자
						<input type="radio" name="gender" value="1" style="margin-left: 150px">여자
					</div>

					<label for="yy"> Birth</label>
					<div class="birthday">
						<div class="bir_wrap">
							<div class="bir_yy">
								<span class="ps_box"> 
									<select id="yy" name="birth" class="sel val" aria-label="년" required="required">
										<option value="">년</option>
									</select>
								</span>
							</div>

							<div class="bir_mm">
								<span class="ps_box"> 
									<select id="mm" name="birth" class="sel val" aria-label="월" required="required">
										<option value="">월</option>
									</select>
								</span>
							</div>

							<div class=" bir_dd">
								<span class="ps_box">
									<select id="dd" name="birth" class="sel val" aria-label="일" required="required">
										<option value="">일</option>
									</select>
								</span>
							</div>
						</div>
						<p>
							<span class="error_next_box" id="birthdayMsg" role="alert"></span>
						</p>
					</div>


					<label> Phone</label> 
					<div>
						<input value="+82" id="country_code" type="hidden"/>
						<input placeholder="phone number" id="phone_number" name="phone" value="" onclick="phoneAuth(); "/>
						<span id="phone_auth_finish" style="display: none">번호 인증 완료</span>
					</div>

					<script defer src="https://www.gstatic.com/firebasejs/5.10.1/firebase-app.js"></script>

					<script defer src="https://www.gstatic.com/firebasejs/5.10.1/firebase-auth.js"></script>
					<script defer src="https://www.gstatic.com/firebasejs/5.10.1/firebase-database.js"></script>
					
					<script defer src="/hos/resources/js/init-firebase.js"></script>


				</div>
				<div class="btn">
					<input type="submit" value="JOIN">
				</div>
			</form>
		</div>
		<!-- //Main -->
	</div>
</body>
</html>