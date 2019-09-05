$(document).ready(function(){
	
	// hover시 nav_bar background-color 변경
	$('body > div.navbar_wrap.fixed-top').hover(function(){
		$('body > div.navbar_wrap.fixed-top').css({
			'background-color':'#fff'
		});
		$('body > div.navbar_wrap.fixed-top > nav.navbar.navbar-expand-lg.navbar-light').css({
			'background-color':'#fff !important'
		});
		
	},function(){
		$('body > div.navbar_wrap.fixed-top').css({
			'background-color':'#ffff33'
		});
		$('body > div.navbar_wrap.fixed-top > nav.navbar.navbar-expand-lg.navbar-light').css({
			'background-color':'#ffff33'
		});
		$('body > div.navbar_wrap.fixed-top > nav.navbar.navbar-expand-sm').css({
			'background-color':'#ffff33'
		});
	});
	
})