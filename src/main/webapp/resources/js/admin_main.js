$(document).ready(function(){
	// navbar 상단 고정 해제
	$('body > div.navbar_wrap.fixed-top').removeClass('fixed-top');

	// 스크롤시 메뉴 고정해주는 함수
	$(window).on('mousewheel',function(e){
		var wheel = e.originalEvent.wheelDelta;
		// 스크롤을 올릴때
		if(wheel>0){
			if($(window).scrollTop() < 300){
				$('body > div.admin_body > div.admin_header').removeClass('fixed-top');
			}
		}else{
			if($(window).scrollTop() > 0){
				$('body > div.admin_body > div.admin_header').addClass('fixed-top');
			}
		}
	});
	
	$('.join_success').on('click', function() {
		alert("가입 승인에 성공하였습니다.");
	});
	
});


