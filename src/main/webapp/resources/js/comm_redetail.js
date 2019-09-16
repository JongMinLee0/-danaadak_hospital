$(document).ready(function(){
	
	// 뒤로가기 버튼 클릭시 발생하는 이벤트
	$('#backBtn').on('click', function(){
		location.href='/hos/comm/review';
	});
	
	// 전송버튼 클릭시 발생 이벤트
	$('#subBtn').on('click', function(){
		var sendData = $('#frm').serialize();
		$.ajax({
			type:'POST',
			url:'/hos/comm/writeCom',
			data:sendData,
			success:function(res){
				$('#comment').val('');
				alert(res);
				location.href="/hos/comm/reviewDetail?vino="+$('#vino').val();
			},error:function(res){
				alert(res);
			}
		});
		return false;
	});
});