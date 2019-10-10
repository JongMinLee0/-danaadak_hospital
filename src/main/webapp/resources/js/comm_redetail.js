$(document).ready(function(){
	var cno = '';
	var vino = $('#vino').val();
	// 뒤로가기 버튼 클릭시 발생하는 이벤트
	$('#backBtn').on('click', function(){
		// 수정 취소시
		if($(this).val()=='취소'){
			location.href='/hos/comm/reviewDetail?vino='+vino;
		}else{
			location.href='/hos/comm/review';
		}
	});
	
	// 전송버튼 클릭시 발생 이벤트
	$('#subBtn').on('click', function(){
		if($('#comment').val()==''){
			swal('내용을 입력하세요!!');
			return false;
		}
		var sendData = $('#frm').serialize();
		// 수정할 때의 로직
		if($(this).val()=='수정완료'){
			$.ajax({
				type:'POST',
				url:'/hos/comm/modifyCom',
				data:sendData,
				success:function(res){
					swal(res).then((value) => {
						location.href='/hos/comm/reviewDetail?vino='+vino;
					  });
				},error:function(res){
					swal(res);
				}
			});
		}else{
			$.ajax({
				type:'POST',
				url:'/hos/comm/writeCom',
				data:sendData,
				success:function(res){
					swal(res).then((value) => {
						  location.href='/hos/comm/reviewDetail?vino='+vino;
					  });
					
				},error:function(res){
					swal(res);
				}
			});
		}
		return false;
	});
	
	// 후기글 삭제 버튼 클릭시
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
					  }).then((value) => {
						location.href='/hos/comm/review'; 
					  });
					 },error:function(){
						 swal("글 삭제에 실패했습니다!!", {
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
	
	// 후기글 수정 버튼 클릭시
	$('#modifyBtn').on('click', function(){
		location.href='/hos/comm/reviewModify?vino='+vino;
	});
	
	
	// 댓글 삭제 버튼 클릭시
	$('body > div.comm_body > div.content_wrap > div.comment_wrap > table > tbody > tr td a:nth-child(3)').on('click', function(){
		var cno = $(this).next().val();
		
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
					 url:'/hos/comm/comDelete?cno='+cno,
					 success:function(){
						 swal("댓글이 삭제되었습니다!!", {
						      icon: "success",
					  }).then((value) => {
						  location.href='/hos/comm/reviewDetail?vino='+vino;
					  });
					 },error:function(){
						 swal("댓글 삭제에 실패했습니다!!", {
						      icon: "warning",
					  });
					 }
				  });
			  } else {
				// cancel 눌렀을 때
			    swal("삭제가 취소되었습니다!");
			  }
			});
		return false;
	});
	
	
	// 댓글 수정 버튼 클릭시
	$('body > div.comm_body > div.content_wrap > div.comment_wrap > table > tbody > tr td a:nth-child(2)').on('click', function(){
		cno = $(this).next().next().val();
		var content = $(this).parent().parent().next().children().text();
		$('#comment').val(content);
		$('#subBtn').val('수정완료');
		$('#backBtn').val('취소');
		$('#vino').attr('name', 'cno');
		$('#vino').val(cno);
		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
		$('body > div.comm_body > div.comm_header').removeClass('fixed-top');
		return false;
	});
	
	
	// 1:1 대화 클릭시
	$('#username').on('click', function(){
		// 채팅 요청자
		var name1 = $('#userId').val();
		// 후기글 작성자
		var name2 = $('#username').val();
		swal({
			  title: $('body > div.comm_body > div.content_wrap > div.detail_wrap > table > tbody > tr:nth-child(2) > td:nth-child(1) > h4').text() 
			  + "님과 대화하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  // ok 눌렀을 때
				  $.ajax({
						url:'/hos/chat/room?name1='+name1+'&name2='+name2,
						type:'POST',
						success:function(response){
							console.log('response : ' + response);
							
							// 이미 대화 중인 상대 인경우
							if(response.exist != null){
								swal(response.exist);
							}else{
								swal('대화가 생성되었습니다');
							}
							//location.href='/hos/comm/chat?name1='+$('#userId').val();
						},
						error:function(){
							alert('대화요청에 실패하였습니다.');
						}
					});
			  } else {
				// cancel 눌렀을 때
			    swal("대화가 취소되었습니다!");
			  }
			});
	});
	
});