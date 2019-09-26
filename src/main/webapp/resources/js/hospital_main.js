$(document).ready(function(){
	$('#event_regi').on('click',function(){
		$('#evn_regi').attr('action','event_register').submit();
	});
});//end ready