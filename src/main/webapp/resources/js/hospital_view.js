$(document).ready(function(){
	$('#insert_modal').addClass('recHide');
	
	$('#rec_btn').on('click',function(){
		$('#insert_modal').addClass('recShow');
		$('#insert_modal').removeClass('recHide');
	})
	

	
	//버튼 누르면 submit
		$('#update_reserve').on('click',function(){
			var upt = $('input[name=re_state]:checked').val();
			$('#re_stateFrm').attr('action','re_stateUpdate').submit();
		});
		
		
	//button add_input 누르면 인풋박스 생김
	$('#add_input').on('click',function(){
		$('#re_stateFrm > table > tbody > tr:nth-child(8) > td').append('<p><input type="text" name="medicine"></p>');
	});
	
	
	$('body > div.quick-menu').css({
		"display":"none"
	});
});//end ready
