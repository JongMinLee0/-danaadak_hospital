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
				kakaoLoginAction(kakao_id);
			}
		}
	});
	return;

}

// 카카오로 회원가입한 사람일 때
function kakaoLoginAction(kakao_id){
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url : '/hos/kakao_login_action',
		data : 'kakao_id=' + kakao_id,
		success : function(res) {
			login(res.username, res.password);
		}
	});
}

function login(username, password){
	$('#username').val(username);
	$('#password').val(password);
	
	$('#login').click();
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