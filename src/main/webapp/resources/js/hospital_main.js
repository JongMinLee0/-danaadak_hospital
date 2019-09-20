$(document).ready(function(){
	$('#event_regi').on('click',function(){
		alert('여기눌럿오요?');
		$('#evn_regi').attr('action','event_register').submit();
	});
});//end ready