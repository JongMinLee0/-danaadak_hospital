$(document).ready(function(){
	
	// 처음 생성된 방은 메세지가 없는 것으로 했는데 이것은 나중에 시간이 없는 방으로 고치면 될 듯.
	if($('body > div.comm_body > div.content_wrap > div table tbody tr.message_wrap td').text() == ''){
		
		$('body > div.comm_body > div.content_wrap > div table tbody tr.message_wrap td').text('새로 생성된 대화 입니다.');
	}
	
	
});