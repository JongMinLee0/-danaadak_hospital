$(document).ready(function(){
	$('#insert_modal').addClass('recHide');
	
	$('#rec_btn').on('click',function(){
		$('#insert_modal').addClass('recShow');
		$('#insert_modal').removeClass('recHide');
	})
	
	//처방전 보내기
	$('#recipe_ins').on('click',function(){
		$('#rec_frm').attr('action','rec_insert').submit();
		$('#insert_modal').addClass('recHide');
	});
	
	
	//버튼 누르면 submit
		$('#update_reserve').on('click',function(){
			var upt = $('input[name=re_state]').val();
			$('#re_stateFrm').attr('action','re_stateUpdate').submit();
		});
		
		
	//button add_input 누르면 인풋박스 생김
	$('#add_input').on('click',function(){
		console.log('1111');
		$('#insert_rec > tbody > tr:nth-child(5) > td > p ').append('<p><input type="text" name="medicine"></p>');
		
	});
	
	$('body > div.quick-menu').css({
		"display":"none"
	});
});//end ready
