$(document).ready(function() {
	
	appendYear();
	
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
	
	var typeParam = getParameters('type');
	
	history.replaceState({}, null, '/hos/login?type='+typeParam);	// 파라미터 지우기
	
	if(typeParam == 'user' || typeParam == ""){
		$('#joinForm').prop('action','/hos/join/join');
	}
	
	if(typeParam == 'hospital'){
		$('#joinForm').prop('action','/hos/join/hosjoin');
	}

	$('#yy').change(function() { // 년도 값이 바뀌면
		$('#mm').val(""); // 월 값 초기화
		$('#dd').val(""); // 일 값 초기화
		removeMonth(); // 월 option 비우기
		removeDay(); // 일 option 비우기
		appendMonth(); // 월 option 생성
	});

	$('#mm').change(function() { // 월 값이 바뀌면
		$('#dd').val(""); // 일 값 초기화
		var day = validDate($('#yy').val(), $('#mm').val());
		removeDay();
		appendDay(day);
	});

	var year = $('#yy').val();
	var month = $('#mm').val();
	var day = $('#dd').val();
	
	$('#username').on('keyup', function(){
		var eventId = $(this).attr('id');
		var username = $("#username").val();
		var regUsername = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		
		if (username == "") {
			showErrorMsg = "필수 정보입니다.";
			changeErrorMsg(eventId, showErrorMsg);
		} else if (!regUsername.test(username)) {
			showErrorMsg = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
			changeErrorMsg(eventId, showErrorMsg);
		} else if(username != "" && regUsername.test(username)){
			$.ajax({
                type:'POST',
                dataType:'text',
                url:'/hos/join/usernameChk',
                data:'username='+$(this).val(),
                success: function(res) {
                	if(res != 0){
                		showErrorMsg = "이미 존재하는 아이디입니다.";
                	}else{
                		showErrorMsg = "";
                	}
                	changeErrorMsg(eventId, showErrorMsg);
                }
			});
		} else {
			showErrorMsg="";
			changeErrorMsg(eventId, showErrorMsg);
		}
		
		return false;
	});
	
	$('#password').on('keyup', function(){
		var eventId = $(this).attr('id');
		var password = $('#password').val();
		var regPassword = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;

		if (password == "") {
			showErrorMsg = "필수 정보입니다.";
			changeErrorMsg(eventId, showErrorMsg);
		} else if (!regPassword.test(password)) {
			showErrorMsg = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
			changeErrorMsg(eventId, showErrorMsg);
		} else {
			showErrorMsg="";
			changeErrorMsg(eventId, showErrorMsg);
		}
		
		return false;
	});
	
	$('#passwordConfirm').on('keyup', function(){
		var eventId = $(this).attr('id');
		var passwordConfirm = $('#passwordConfirm').val();
		
		if ($('#password').val() != passwordConfirm) {
			showErrorMsg = "비밀번호가 일치하지 않습니다.";
			changeErrorMsg(eventId, showErrorMsg);
		} else {
			showErrorMsg="";
			changeErrorMsg(eventId, showErrorMsg);
		}
		
		return false;
	});
	
	
	$('#hos_name').on('keyup', function(){
		if($('#hos_name').val() != ""){
			$('.list-group').css({
				'display' : 'block'
			});
			$.ajax({
				type : 'POST',
				dataType : 'json',
				url : '/hos/join/findHos',
				data : 'keyword=' + $('#hos_name').val(),
				success : function(res) {
					console.log(res);
					if(res.length != 0){
						appendHospital(res);
					}
					
				}
			});
		}else{
			$('.list-group').css({
				'display' : 'none'
			});
		}
		
	});
	
	$(document).on('click','.hosResult',function(){
		var index = $(this).index();
		var hosId = $('#hosid').eq(index).val();
		var hosName = $('.m-0').eq(index).text();
		var hosAddress = $('.text-muted').eq(index).text();

		$('.list-group').css({
			'display' : 'none'
		});
		
		$('#hos_id').val(hosId);
		$('#hos_address').val(hosAddress);
		$('#hos_name').val(hosName);
	});
	
	$('#joinBtn').click(function(){		// 회원가입 버튼을 누르면
		if(!inputChk()) { 	// return값이 false이면
			swal('빈 칸을 모두 입력해 주세요.'); 
			return false;
		}
		if($('#phone_auth_finish').css('display')=='none'){
			$('#phone_number').val("");
			swal('번호 인증을 완료해주세요.'); 
			return false;
		}
		if($('.error_next_box').text()!=""){
			swal("입력한 값을 확인해주세요.");
			return false;
		}
		
		return true;
	});

});

// option 추가 new Option("option text", "value");
function appendYear() {
	var date = new Date();
	var year = date.getFullYear();

	for (var i = year; i >= 1900; i--) {
		$('#yy').append(new Option(i + "년", i));
	}
}

function appendMonth() {
	for (var i = 1; i <= 12; i++) {
		var j = i;

		if (i < 10) {
			j = "0" + i;
		}
		$('#mm').append(new Option(i + "월", j));
	}
}

function removeMonth() {
	$("#mm.sel option:gt(0)").remove();
}

function validDate(year, month) { // 유효한 날짜값만 가져오는 함수
	var monthArr = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
	var day;
	if (month !== "2" && $.isNumeric(month)) {
		day = monthArr[Number(month) - 1];
	} else {
		if ($.isNumeric(year)) {
			var intYear = Number(year);
			if ((intYear % 4 === 0 && intYear % 100 !== 0)
					|| intYear % 400 === 0) { // 윤년이면
				day = 29;
			} else { // 평년이면
				day = 28;
			}
		} else {
			day = 31;
		}
	}
	return day;
};

function appendDay(day) {
	for (var i = 1; i <= day; i++) {
		var j = i;

		if (i < 10) {
			j = "0" + i;
		}
		$('#dd').append(new Option(i + "일", j));
	}
}

function removeDay() {
	$("#dd.sel option:gt(0)").remove();
}

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("roadAddress").value = roadAddr;

		}
	}).open();
}

function phoneAuth() {
	$('#phone_auth_finish').val("");
	var url = "/hos/join/phone";
	var name = "phone auth";
	var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	window.open(url, name, option);
}

function appendHospital(res) {
	$('.hosResult').remove();
	for (var i = 0; i < res.length; i++) {
		$('.list-group').append('<div class="hosResult list-group-item list-group-item-action">'
				+'<p class="m-0" >'+res[i].hos_name+'</p>'
				+'<small class="text-muted">'+res[i].hos_address+'</small>'
				+'<input type="hidden" id="hosid" value="'+res[i].hos_id+'">'
				+'</div>');
	}
}

function changeErrorMsg(eventId, showErrorMsg){
	$('#'+eventId+'Msg').text(showErrorMsg);
}


function inputChk() {
	var result = true;
	$('.val').each(function(idx, ele) {
		if ($(ele).val() == "") {
			result = false;
			return false;
		}
	});
	return result;
}
