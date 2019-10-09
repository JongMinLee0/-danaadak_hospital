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
	var responseMessage = getParameters('successMsg');
	
//	alert(typeParam);
	
	if(typeParam == 'user' || typeParam == ""){
		$('#perBtn').click();
	}
	
	if(typeParam == 'hospital'){
		$('#hosBtn').click();
	}
	
	$('#perBtn').on('click',function() {
		location.href = 'login?type=user';
	});
	
	$('#hosBtn').on('click',function() {
		location.href = 'login?type=hospital';
	});

	if ($.cookie('id')) {
		$('#username').val($.cookie('id'));
		$('#save_id').prop('checked', 'true');
	}

	$('form').submit(function() {
			
		if ($('#username').val() == '') {
			swal('아이디를 입력해주세요');
			return false;
		};
	
		if ($('#password').val() == '') {
			swal('비밀번호를 입력해주세요');
			return false;
		};
		
		if($('#username').val() != "" && $('#password').val() != ""){
			if(typeParam==undefined){
				typeParam = 'user';
			}
			
			if ($('#save_id').prop('checked') && $('#username').val()){
				$.cookie('id', $('#username').val());
			}
			
			var rtn = false;
				
			$.ajax({
				type : 'POST',
				dataType : 'text',
				url : '/hos/login/typeChk',
				data : 'username=' + $('#username').val(),
				async : false,
				success : function(res){
					if(res != typeParam){

						swal('타입을 잘못 선택하셨거나 존재하지 않는 아이디입니다.');

						rtn = false;
						return false;
					}else{
						rtn = true;
					}
				}
			});
		};
		
		return rtn;
		
	});
	
});


// 카카오 로그인
function kakaoLogin(kakao_id, email, userNickName, profileImage) {
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : '/hos/kakao_login',
		data : 'kakao_id=' + kakao_id,
		success : function(res) {
			if (res != 1) {
				swal({
					title : "등록되지 않은 회원입니다.",
					text : "카카오톡 정보로 회원가입 하시겠습니까?",
					buttons : ["YES", "NO"]
				}).then((YES) => {
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
							+ nickname + '&kakao_id=' + kakao_id + '&profile_image=' + profileImage ;
				});
			} else {
				location.href = "/hos/kakaoLogin?kakao_id="+kakao_id;
			}
		}
	});
	return;

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

function findIdPw(){
    var url = "/hos/member/findIdPwForm";
    var name = "아이디/비밀번호 찾기";
    var option = "width = 440, height = 510, top = 100, left = 200, location = no"
    window.open(url, name, option);
}