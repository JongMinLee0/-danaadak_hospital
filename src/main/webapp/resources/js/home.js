$(document).ready(function(){

	// 스크롤 움직일 때 메뉴바의 색상이 변경
	$(window).scroll(function(){
		if($(this).scrollTop()>0){
			$('body > div.navbar_wrap.fixed-top').css({
				'background-color':'#fff'
			});
		}else if($(this).scrollTop()==0){
			$('body > div.navbar_wrap.fixed-top').css({
				'background-color':''
			});
		}
	});
	// top으로 이동
	$('#top_btn_wrap i').on('click', function(){
		$('html').scrollTop(0);
	});
	
	// 병원 접수하기 버튼
	$('body > div.home_image_wrap > div > button').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}else{
			location.href='/hos/map';
		}
	});
	
	// 정형외과
	$('body > div.wrap > ol.wow.fadeInUpBig.odd > a:nth-child(1)').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}else{
			location.href='/hos/map?keyword=정형외과';
		}
	});
	
	// 내과
	$('body > div.wrap > ol.wow.fadeInUpBig.odd > a:nth-child(2)').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}else{
			location.href='/hos/map?keyword=내과';
		}
	});
	
	// 치과
	$('body > div.wrap > ol.wow.fadeInUpBig.odd > a:nth-child(3)').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}else{
			location.href='/hos/map?keyword=치과';
		}
	});
	
	// 안과
	$('body > div.wrap > ol.wow.fadeInUpBig.odd > a:nth-child(4)').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}else{
			location.href='/hos/map?keyword=안과';
		}
	});
	
	// 산부인과
	$('body > div.wrap > ol.wow.fadeInUpBig.even > a:nth-child(1)').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}else{
			location.href='/hos/map?keyword=산부인과';
		}
	});
	
	// 소아청소년과
	$('body > div.wrap > ol.wow.fadeInUpBig.even > a:nth-child(2)').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}else{
			location.href='/hos/map?keyword=소아청소년과';
		}
	});
	
	// 성형외과
	$('body > div.wrap > ol.wow.fadeInUpBig.even > a:nth-child(3)').on('click',function(){
		if($('#navbarSupportedContent > span').text()==''){
			swal("로그인이 필요한 서비스 입니다!!", {
			      icon: "warning",
		  }).then((value) => {
			  location.href='/hos/login';
		  });
			return false;
		}else{
			location.href='/hos/map?keyword=성형외과';
		}
	});
})