<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>로그인 페이지</title>
<link rel="stylesheet" href="/hos/resources/css/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="/hos/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/hos/resources/js/login.js"></script>
<script src="/hos/resources/js/jquery.cookie.js"></script>
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>

<body>
	<jsp:include page="/WEB-INF/views/fragments/nav_bar.jsp" />

	<c:if test="${param.error == true}">
		<script>
			swal("회원정보를 다시 확인해주세요.");
			history.replaceState({}, null, location.pathname);
		</script>
	</c:if>

	<form:form name="f" method="POST" id="loginForm">
		<div class="wrapper">
			<div class="main">
				<div class="header">
					<h1>로그인</h1>
				</div>
				
				<div class="login_box">
					
				<div class="login_type">
					<button type="button" class="active" id="perBtn" onclick="wloginCont('perForm',this)">개인회원</button><button type="button" class="" id="comBtn" onclick="wloginCont('comForm',this)">기업회원</button>
				</div>
				
					<div class="input_login">
						<input type="text" id="username" name="username" value="${username }" placeholder="아이디를 입력하세요">
					</div>
					<div class="input_login">
						<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
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
		Kakao.init('b3d7a633df59dd53f7c8ebabd3e89897');
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

					//	console.log(kakao_id, email, userNickName);

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




