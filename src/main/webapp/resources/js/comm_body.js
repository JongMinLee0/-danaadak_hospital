$(document).ready(function(){
	
	// 부모보다 크게 하기 위해서
	// 화면의 크기를 구한 후 꽉차게 만든다.
	var windowWidth = $(window).width();
	$('#community_description').css({
		'width':windowWidth
	});

	$( window ).resize(function() {
		var windowWidth = $(window).width();

		$('#community_description').css({
			'width':windowWidth
		});
	});
	// top으로 이동
	$('#top_btn_wrap i').on('click', function(){
		$('html').scrollTop(0);
	});
});