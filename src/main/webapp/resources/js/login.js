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

});


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