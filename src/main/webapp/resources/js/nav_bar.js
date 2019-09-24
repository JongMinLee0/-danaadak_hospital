$(document).ready(function(){
	
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
	
	$('body > div.navbar_wrap.fixed-top > nav.navbar.navbar-expand-sm > ul > li:nth-child(2) > a').on('click', function(){
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