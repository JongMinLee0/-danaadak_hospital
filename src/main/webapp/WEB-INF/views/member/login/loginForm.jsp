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
<script type="text/javascript">
$(document).ready(function(){
	var responseMessage = "<c:out value="${successMsg}" />";
	
	var getParameters = function (paramName) {
	    // 리턴값을 위한 변수 선언
	    var returnValue;

	    // 현재 URL 가져오기
	    var url = location.href;

	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

	    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
	    for (var i = 0; i < parameters.length; i++) {
	        var varName = parameters[i].split('=')[0];
	        if (varName.toUpperCase() == paramName.toUpperCase()) {
	            returnValue = parameters[i].split('=')[1];
	            return decodeURIComponent(returnValue);
	        }
	    }
	}
	
	// console.log(getParameters('type'));
	var typeParam = getParameters('type');
	
	if(responseMessage != ""){
		swal(responseMessage).then(function(){
			window.location = '/hos/login?type='+typeParam;
		});
	};
	
	var errorMsg = '${errorMsg}';
	var type = '${type}';
	
	if(errorMsg != ""){
		swal({
			title : errorMsg.split(".")[0],
			text : errorMsg.split(".")[1]
		}).then(function(){
			window.location = '/hos/login?type='+type;
		});
	}
	
});

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragments/nav_bar.jsp" />
	
	<form:form name="f" method="POST" id="loginForm" action="/hos/login">
		<div class="wrapper">
			<div class="main">
				<div class="header">
					<h1>로그인</h1>
				</div>
				
				<div class="login_box">
					
				<div class="login_type">
					<button type="button" class="active" id="perBtn" onclick="wloginCont('perForm',this)">개인회원</button><button type="button" class="" id="hosBtn" onclick="wloginCont('hosForm',this)">병원회원</button>
				</div>
				
				<c:choose>
					<c:when test="${param.type == null}">
			        	<c:set value="user" var="type" />
					</c:when>
					<c:otherwise>
			        	<c:set value="${param.type }" var="type" />
					</c:otherwise>
				</c:choose>
					<input type="hidden" id="type" name="type" value="${type }">
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
					<c:if test="${type == 'user' }">
						<div>
							<input id="kakao_login" type="button" value="카카오톡 로그인">
						</div>
					</c:if>
					<div class="last">
						<div>
							<a href="" class="findIdPw" onclick="findIdPw();">아이디/비밀번호 찾기</a>
							<c:if test="${type == 'user' }">
								<a href="/hos/join/joinForm?type=user" class="join">회원가입</a>
							</c:if>
							<c:if test="${type == 'hospital' }">
								<a href="/hos/join/joinForm?type=hospital" class="join">병원 회원가입</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>

	<c:if test="${type == 'user' }">
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
							var profileImage = res.properties.thumbnail_image;
							console.log(kakao_id, email, userNickName, profileImage);
	
							kakaoLogin(kakao_id, email, userNickName, profileImage);
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
	</c:if>
</body>
</html>




