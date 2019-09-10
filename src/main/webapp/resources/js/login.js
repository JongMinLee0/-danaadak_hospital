$(document).ready(function() {
	if ($.cookie('id')) {
		$('#user_id').val($.cookie('id'));
		$('#save_id').prop('checked', 'true');
	}

	$('#login').on('click', login);
	$("input").keypress(function(e) {
		if (e.which == 13) { // 엔터키를 누르면
			login();
		}
	});

	$('.logo img').on('click', function() {
		location.href = '/semiRecipe/recipe/home';
	});
});
function login() {
	if ($('#save_id').prop('checked') && $('#user_id').val() != ""
			&& $('#user_pw').val() != "") {
		$.cookie('id', $('#user_id').val());
	};

	if ($('#user_id').val() != "" && $('#user_pw').val() != "") {
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : '/semiRecipe/recipe/login',
			data : 'user_id=' + $('#user_id').val() + '&user_pw='
					+ $('#user_pw').val(),
			success : function(res) {
				if (res != 1) {
					swal("회원정보를 다시 확인해주세요.");
				} else {
					// swal(document.referrer);
					location.href = document.referrer;
				}
			}
		});
		return false;
	} else {
		swal("아이디와 비밀번호를 모두 입력해주세요.");
	}

}

function kakaoLogin(kakao_id, email, userNickName) {
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : '/semiRecipe/recipe/kakao_login',
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

					location.href = '/semiRecipe/recipe/registerForm?id='
							+ id
							+ '&nickname='
							+ nickname
							+ '&kakao_id=' + kakao_id;
				}
			} else {
				location.href = document.referrer;
			}
		}
	});
	return;

}