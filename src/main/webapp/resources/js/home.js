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
})