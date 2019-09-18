$(document).ready(function() {
	$("#username").focus();

	if ($.cookie('id')) {
		$('#username').val($.cookie('id'));
		$('#save_id').prop('checked', 'true');
	}

	$('#loginForm').submit(
		function() {
			if ($('#username').val() == '') {
				swal('아이디를 입력해주세요');
				return false;
			}

			if ($('#password').val() == '') {
				swal('비밀번호를 입력해주세요');
				return false;
			}

			if ($('#save_id').prop('checked')
					&& $('#username').val() != ""
					&& $('#password').val() != "") {
				$.cookie('id', $('#username').val());
			};

			$(this).submit();
	});

});

function setAuthorizationCode(code) {
	var params = {
		grant_type : "authorization_code",
		code : code,
		client_id : f90d0bc90a5a0e00f6930fef7657156e,
		redirect_uri : 'http://localhost:8090/auth'
	};

	$.ajax({
		type : "POST",
		dataType : "json",
		url : tokenRequestUrl,
		data : params
	}).success(function(data) {
		setAuthObj(data);
	}).error(function(jqXHR, error) {
		var errorJson = JSON.parse(jqXHR.responseText);
		console.log(errorJson);
		if (errorJson.msg && /callerIp/.test(errorJson.msg))
			$('#ip-auth-error-alert').modal('show');
		else if (errorJson.msg)
			authErrorAlert(errorJson.msg)
		else
			authErrorAlert('인증 중 에러가 발생하였습니다. 잠시 후 다시 시도해 주세요.')
	});
}

// 카카오 로그인
function kakaoLogin(kakao_id, email, userNickName) {
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : '/hos/kakao_login',
		data : 'kakao_id=' + kakao_id,
		success : function(res) {
			if (res != 1) {
				var chk = confirm("등록되지 않은 회원입니다. 카카오톡 정보로 회원가입 하시겠습니까?");
				if (chk) {
					if (!(typeof email == "undefined")) {
						id = email.split("@")[0];
					} else {
						id = "";
					}

					if (!(typeof userNickName == "undefined")) {
						nickname = userNickName;
					} else {
						nickname = "";
					}

					location.href = '/hos/join/joinForm?id=' + id + '&name='
							+ nickname + '&kakao_id=' + kakao_id;
				}
			} else {
				location.href = document.referrer;
			}
		}
	});
	return;

}

// 회원구분 버튼
function wloginCont(id, obj) {
	$('#perBtn,#comBtn').removeClass('active');
	$('#perForm,#comForm').hide();

	$(obj).addClass('active');

	if (id == 'perForm')
		$('#' + id).show();
	else if (id == 'comForm') {
		$('#' + id).attr('style', 'visibility:visible');
		$('#' + id).show();
	}
}