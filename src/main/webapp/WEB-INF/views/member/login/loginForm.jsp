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
						<input type="text" id="username" name="username"
							value="${loginId }" placeholder="아이디를 입력하세요">
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
						<input id="kakao_login" type="button" value="카카오톡 로그인">
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

	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('c8ee897a0db2b7e1891baf231ece5129');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao_login',
			success : function(authObj) {
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						console.log(res);
						var kakao_id = res.id; //유저가 등록한 계정
						var email = res.kaccount_email; //유저가 등록한 계정
						var userNickName = res.properties.nickname; //유저가 등록한 별명

						console.log(kakao_id, email, userNickName);

						kakaoLogin(kakao_id, email, userNickName);
					},
					fail : function(error) {
						swal(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				swal(JSON.stringify(err));
			}
		});
		//]]>
	</script>


</body>
</html>




