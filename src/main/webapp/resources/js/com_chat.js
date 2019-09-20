$(document).ready(function(){
	
	console.log('text : ' + $('body > div.comm_body > div.content_wrap > div > table > tbody tr .message_wrap td').text());
	
	if($('body > div.comm_body > div.content_wrap > div > table > tbody tr .message_wrap td').text() == ''){
		$(this).text('새로 생성된 대화 입니다.');
	}
});