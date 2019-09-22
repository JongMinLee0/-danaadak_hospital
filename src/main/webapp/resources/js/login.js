$(document).ready(function() {
	$("#username").focus();

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
//	alert(typeof typeParam);
//	alert(typeParam == 'hospital');
//	alert(typeParam == 'user');
	
	if(typeParam == 'user' || typeParam == ""){
		$('#perBtn').click();
	}
	
	if(typeParam == 'hospital'){
		$('#hosBtn').click();
	}
	
	
	

	if ($.cookie('id')) {
		$('#username').val($.cookie('id'));
		$('#save_id').prop('checked', 'true');
	}

	$('#loginForm').submit(
		function() {
			if ($('#username').val() == '') {
				swal('아이디를 입력해주세요');
				return false;
			};

			if ($('#password').val() == '') {
				swal('비밀번호를 입력해주세요');
				return false;
			};

			
			if($('#username').val() != "" && $('#password').val() != ""){
				if ($('#save_id').prop('checked') && $('#username').val()){
					$.cookie('id', $('#username').val());
				}
				$(this).submit();
				return false;
			}

	});
	
	$('#perBtn').on('click',function() {
		location.href = 'login?type=user';
	});
	
	$('#hosBtn').on('click',function() {
		location.href = 'login?type=hospital';
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

					location.href = '/hos/join/joinForm?type=user&id=' + id + '&name='
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
	$('#perBtn,#hosBtn').removeClass('active');
	$('#perForm,#hosForm').hide();

	$(obj).addClass('active');

	if (id == 'perForm')
		$('#' + id).show();
	else if (id == 'comForm') {
		$('#' + id).attr('style', 'visibility:visible');
		$('#' + id).show();
	}
}