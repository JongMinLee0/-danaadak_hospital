$(document).ready(function(){
	
	// 병원 / 약국 페이지 로그인 알림
	$('#navbarSupportedContent > ul > li:nth-child(1) > a').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}
	});
	
	// 커뮤니티 로그인 알림
	$('#navbarSupportedContent > ul > li:nth-child(2) > a').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}
	});
	
	// 마이페이지 로그인 알림
	$('body > div.navbar_wrap.fixed-top > nav.navbar.navbar-expand-sm > ul > li > a').on('click', function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}
	});
	
})