<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
<link rel="stylesheet" href="/hos/resources/css/findIdPw.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/hos/resources/js/findIdPw.js"></script>
</head>
<body style="background: #b7d3f126;">
	<header class="findIdPwHeader">
		<h3>다나앗닥 계정 찾기</h3>
	</header>
	<div>
		<div class="findIdPwForm">
			<ul>
				<li id="findId" class="on" onclick="wloginCont('perForm',this)">ID찾기</li><li id="findPw" class="off" onclick="wloginCont('hosForm',this)">비밀번호 찾기</li>
			</ul>

			<div>
				<p>아래의 정보를 입력해주세요.</p>
			</div>
			<div>
				<form id="findFrm" method="post">
					<input type="hidden" id="findType" name="findType" value="findId">
					<label class="username" for="username">아이디</label>
					<input class="username" id="username" name="username" type="text" required="required" />
					<label for="name">이름</label>
					<input id="name" name="name" type="text" required="required" />
					<label for="name">전화번호</label>
					<input id="phone" name="phone" type="text" required="required" />
				</form>
			</div>
			
			<div>
				<input type="hidden" id="password" />
				<input type="hidden" id="passwordConfirm" />
			</div>

			<div class="btns">
				<div class="button">
					<input type="submit" value="ID 찾기" id="findBtn" onclick="startApp()" /><br />
				</div>
			</div>
		</div>
	</div>
</body>
</html>