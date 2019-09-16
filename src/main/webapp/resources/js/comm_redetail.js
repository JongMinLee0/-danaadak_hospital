$(document).ready(function(){
	
	// 뒤로가기 버튼 클릭시 발생하는 이벤트
	$('#backBtn').on('click', function(){
		location.href='/hos/comm/review';
	});
	
	// 전송버튼 클릭시 발생 이벤트
	$('#subBtn').on('click', function(){
		if($('#comment').val()==''){
			swal('내용을 입력하세요!!');
			return false;
		}
		var sendData = $('#frm').serialize();
		$.ajax({
			type:'POST',
			url:'/hos/comm/writeCom',
			data:sendData,
			success:function(res){
				var content = $('#comment').val();
				$('#comment').val('');
				swal(res);
				var name = $('#name').val();
				// 현재 시간 구하기
				var Now = new Date();
				var NowTime = Now.getFullYear();
				NowTime += '-' + (Now.getMonth()+1);
				NowTime += '-' + Now.getDate();
				NowTime += ' ' + Now.getHours();
				NowTime += ':' + Now.getMinutes();
				NowTime += ':' + Now.getSeconds();
				
				$('.comment_table').append('<tr>'
						+'<td><hr /><h5>'+name+'</h5></td>'
						+'<td><hr />'+NowTime+'</td></tr><tr>'
						+'<td colspan="2">'+content+'<br /><br /></td></tr>');
				$("html, body").animate({ 
                    scrollTop: $( 
                      'html, body').get(0).scrollHeight
                }, 2000); 
			},error:function(res){
				swal(res);
			}
		});
		return false;
	});
	
	// 삭제 버튼 클릭시
	$('#deleteBtn').on('click', function(){
		swal({
			  title: "정말 삭제하시겠습니까??",
			  text: "한번 삭제하면 복구 할 수 없습니다!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  // ok 눌렀을 때
				  $.ajax({
					 type:'post',
					 url:'/hos/comm/delete?vino='+$('#vino').val(),
					 success:function(){
						 swal("글이 삭제되었습니다!!", {
						      icon: "success",
					  });
					 },error:function(){
						 swal("글이 삭제에 실패했습니다!!", {
						      icon: "warning",
					  });
					 }
				  });
				  
				  
			  } else {
				// cancel 눌렀을 때
			    swal("삭제가 취소되었습니다!");
			  }
			});
	});
	
	// 수정 버튼 클릭시
	$('#modifyBtn').on('click', function(){
		location.href='/hos/comm/reviewModify?vino='+$('#vino').val();
	});
});