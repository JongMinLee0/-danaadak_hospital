$(document).ready(function(){
	//버튼 누르면 submit
		$('#update').on('click',function(){
			var upt = $('input[name=re_state]').val();
			alert(upt);
			$('#frm').attr('action','re_stateUpdate').submit();
		});
		
});//end ready