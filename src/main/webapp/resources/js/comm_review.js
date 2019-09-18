$(document).ready(function(){
	
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
							appendCode += '<li>'+'<a class="list_link" href="/hos/comm/reviewDetail?vino='+item.vino+'"><table>'+'<tr><td><h4>'
							+item.name+'</h4></td></tr><tr><td style="color:orange">'
							
							for(var i=0; i<item.vi_star; i++){
								appendCode += '★';
							}
							
							appendCode += '</td><td>'+item.vi_date+'</td></tr><tr>'+'<td>'
							+item.vi_hash+'</td>'+'<td style="text-align: center">'
							+item.hos_name+'</td>'+'</tr><tr><td><p> </p></td></tr><tr>'
							+'<td>'+item.vi_subject+'</td></tr></table></a><hr /></li>';
							$('body > div.comm_body > div.content_wrap > ul').append(appendCode);
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
							appendCode += '<li>'+'<a class="list_link" href="/hos/comm/reviewDetail?vino='+item.vino+'"><table>'+'<tr><td><h4>'
							+item.name+'</h4></td></tr><tr><td style="color:orange">'
							
							for(var i=0; i<item.vi_star; i++){
								appendCode += '★';
							}
							
							appendCode += '</td><td>'+item.vi_date+'</td></tr><tr>'+'<td>'
							+item.vi_hash+'</td>'+'<td style="text-align: center">'
							+item.hos_name+'</td>'+'</tr><tr><td><p> </p></td></tr><tr>'
							+'<td>'+item.vi_subject+'</td></tr></table></a><hr /></li>';
							$('body > div.comm_body > div.content_wrap > ul').append(appendCode);
						});
						page++;
					}
				});
			}
		}
	});
});