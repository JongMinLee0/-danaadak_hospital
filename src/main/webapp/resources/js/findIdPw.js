$(document).ready(
		function() {
			if ($('#findType').val() == 'findId') {
				$('.username').css('display', 'none');
			} else {
				$('.username').css('display', 'block');
			}

		});

function wloginCont(id, obj) {
	$('#findId,#findPw').removeClass('on');
	$(obj).addClass('on');

	if (id == 'perForm')
		$('#' + id).show();
	else if (id == 'comForm') {
		$('#' + id).attr('style', 'visibility:visible');
		$('#' + id).show();
	}

	$('#findType').val(obj.id);

	if ($('#findType').val() == 'findId') {
		$('.username').css('display', 'none');
	} else {
		$('.username').css('display', 'block');
	}

	$('#findBtn').val("패스워드 변경");
}

function startApp(){
	$.ajax({
        type:'POST',
        dataType:'text',
        url:'/hos/member/findIdPw',
        async : true,
        data: {
            type:$('#findType').val(),
            username: $('#username').val(),
            name : $('#name').val(),
            phone : $('#phone').val()
        },
        success: function(res) {
        	var firstPW = '';
    		var secondPW = '';
    		
        	if(res=="비밀번호 수정"){
        		changePassword();
        	}else{
        		swal(res);
        		return false;
        	}
        }
	});
}

function changePassword(){
	swal({
		title: '비밀번호를 수정합니다.',
		text:'8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
		content: {
			element: "input",
			attributes: {
				placeholder: "비밀번호를 입력",
				type: "password",
			},
		},
	}).then((value) => {
		$('#password').val(value);
		swal({
			title: '비밀번호를 확인해주세요',
			text:'8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
			content: {
				element: "input",
				attributes: {
    				placeholder: "비밀번호를 확인",
    				type: "password",
				},
			},
		}).then((value) => {
			$('#passwordConfirm').val(value);
			changePasswordAction();
		});
	});
	return false;
}

function changePasswordAction(){
	var regPassword = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
		
	if($('#password').val()=="" && $('#passwordConfirm').val()==""){
		return false;
	}else if (!regPassword.test($('#password').val())) {
		swal('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.').then(function(){
			changePassword();
		});
		
		return false;
	}else if($('#password').val()!=$('#passwordConfirm').val()){
		swal('비밀번호가 다릅니다.').then(function(){
			changePassword();
		});
		
		return false;
	}else{
		$.ajax({
	        type:'POST',
	        dataType:'text',
	        url:'/hos/member/passwordChange',
	        async: true, 
	        data: {
	        	username : $('#username').val(),
	            password : $('#password').val(),
	            name : $('#name').val()
	        },
	        success:function(res){
	        	swal(res).then((value) => {
	                  self.close();
                });
	        	return false;
	        }
		});
	}
	
	
}
	