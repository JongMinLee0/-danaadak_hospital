<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>로그인 페이지</title>
<link rel="stylesheet" href="/hos/resources/css/login.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
	<c:url value="/login" var="loginUrl" />
	<c:if test="${param.error != null}">
		<script>
			swal("회원정보를 다시 확인해주세요.").then(function() {
				location.href = "/hos/login/loginForm";
			});
		</script>
	</c:if>

	<form:form name="f" action="${loginUrl}" method="POST">
		<div class="wrapper">
			<div class="main">
				<div class="header">
					<h1>로그인</h1>
				</div>
				<div class="login_box">
					<div class="input_login">
						<input type="text" id="username" name="username"  value="${loginId }" placeholder="아이디를 입력하세요">
					</div>
					<div class="input_login">
						<input type="password" id="password" name="password"
							placeholder="비밀번호를 입력하세요">
					</div>
					<div class="check">
						<label><input type="checkbox" id="save_id">아이디 저장</label>
					</div>
					<div>
						<input id="login" type="submit" value="로그인">
					</div>
					<div>
						<input id="kakao_login" type="submit" value="카카오톡 로그인">
					</div>


					<div class="last">
						<div>
							<a href="/hos/join/joinForm" id="join">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>




