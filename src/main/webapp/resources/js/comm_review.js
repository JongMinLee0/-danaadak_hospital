$(document).ready(function(){
	
	// 부모보다 크게 하기 위해서
	// 화면의 크기를 구한 후 꽉차게 만든다.
	var windowWidth = $(window).width();
	$('#review_description').css({
		'width':windowWidth
	});

	$( window ).resize(function() {
		var windowWidth = $(window).width();

		$('#review_description').css({
			'width':windowWidth
		});
	});
	// top으로 이동
	$('#top_btn_wrap i').on('click', function(){
		$('html').scrollTop(0);
	});

	
	// 페이지 무한 스크롤 페이징 처리
	var page = 2;
	var url = $(location).attr('pathname');
	$(window).on('scroll', function(){
		var scrollHeight = $(document).height();
		var scrollPosition = $(window).height() + $(window).scrollTop();
		if(scrollPosition > scrollHeight - 200){
			if(url='/hos/comm/reviewHash'){
				// 해시태그를 클릭했을 때
				$.ajax({
					type:'post',
					url:'/hos/comm/scrollHash?page='+page+'&vi_hash='+$('#vi_hash').val(),
					success:function(pList){
						$.each(pList, function(index, item){
							var appendCode = '';
							appendCode += '<a class="list_link" href="/hos/comm/reviewDetail?vino='+item.vino+'"><div class="card border-secondary mb-3">'
							+'<div class="card-header">'+item.name+'</div><div class="card-body text-secondary"><h5 class="card-title" style="font-weight: bold;">'
							+item.vi_subject+'</h5><p class="card-text">'
							
							for(var i=0; i<item.vi_star; i++){
								appendCode += '★';
							}
							
							appendCode += '</p><p class="card-text">'+item.vi_date+'</p><p class="card-text">'
							+item.vi_hash+'</p><p class="card-text">'+item.hos_name+'</p>';
							$('body > div.comm_body > div.content_wrap').append(appendCode);
						});
						page++;
					}
				});
			}else{
				// 해시태그를 클릭하지 않았을 때
				$.ajax({
					type:'post',
					url:'/hos/comm/scrollReview?page='+page,
					success:function(pList){
						$.each(pList, function(index, item){
							var appendCode = '';
							appendCode += '<a class="list_link" href="/hos/comm/reviewDetail?vino='+item.vino+'"><div class="card border-secondary mb-3">'
							+'<div class="card-header">'+item.name+'</div><div class="card-body text-secondary"><h5 class="card-title" style="font-weight: bold;">'
							+item.vi_subject+'</h5><p class="card-text">'
							
							for(var i=0; i<item.vi_star; i++){
								appendCode += '★';
							}
							
							appendCode += '</p><p class="card-text">'+item.vi_date+'</p><p class="card-text">'
							+item.vi_hash+'</p><p class="card-text">'+item.hos_name+'</p>';
							$('body > div.comm_body > div.content_wrap').append(appendCode);
						});
						page++;
					}
				});
			}
		}
	});
});