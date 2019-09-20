$(document).ready(function(){
	
	
	var result = true;
	//예약 모달 숨기기
	$('#insertModal').addClass('insertHide');
	
	//예약버튼 누르면 모달창 가져온다.
	$(document).on('click','#map > div:nth-child(1) > div > div:nth-child(6) > div:nth-child(16) > div:nth-child(2) > div > div > div.body > div.desc > div:nth-child(4) > button',function(){
		$('#insertModal').removeClass('insertHide');
		$('#insertModal').addClass('insertShow');
		
		//모달 창에 닫기 버튼
		$('#closeBtn').on('click',function(){
			$('#insertModal').removeClass('insertShow');
			$('#insertModal').addClass('insertHide');
		});
	});//예약버튼 누르기  끝
	
	//예약시간 뿌려주기 
	var nowDay = new Date().toISOString().substring(0, 10);
	$("#re_date").val(nowDay);
	
	var re_time_array = ['09:00','09:30','10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '14:00','14:30','15:00',
						'15:30', '16:00','16:30','17:00','17:30'];
	$.each(re_time_array,function(index, value){
		  $('#re_time').append(
		  		"<option value="+value+">"+value+"</option>"
		  );
	 });
	
	$('#re_date').on('click',function(){
		alert('달력눌렀니? ')
		calendar();
	});
	
	//예약시간 가능 여부 확인 위한 ajax !!!!
	$('#time_chk').on('click',function(){
		//선택한 예약날짜와 예약시간 받기 
		var sel_time= $('#re_time option:selected').val();
		var sel_date = $('#re_date').val();
		var hos_id = $('#hos_id').val();
		console.log(sel_time,sel_date);
		var totalData = 're_time='+sel_time+'&re_date='+sel_date+'&hos_id='+hos_id;
		var data = encodeURI(totalData);
		$.ajax({
			type:'GET',
			dataType:'json',
			url : 'check_time?'+data,
			success: function(res){
				if(res==1){
					swal('선택하신 시간은 예약할 수 없습니다.');
					result = false;
				}else{
					swal('선택하신 시간은 예약가능한 시간입니다.');
					result = true;
				}
			}
		});
	});
	
	/*datepicker 달력 , 이전 날짜 선택 불가, 오늘로부터 2주까지 예약 가능*/
	function calendar() {$("#re_date").datepicker({
							prevText : '이전 달',
							nextText : '다음 달',
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월','7월', '8월', '9월', '10월', '11월', '12월' ],
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월','6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
							dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							dateFormat : 'yy.mm.dd',
							showMonthAfterYear : true,
							yearSuffix : '년',
							minDate:'0',
							maxDate : '+14d', 
							onSelect : function(selectedDate) {
			                     var option = this.id == "from" ? "minDate"
			                             : "maxDate", instance = $(this).data(
			                             "datepicker"), date = $.datepicker
			                             .parseDate(
			                                   instance.settings.dateFormat
			                                         || $.datepicker._defaults.dateFormat,
			                                   selectedDate, instance.settings);
			                    }
						});
	};//end date picker
	
	//날짜 선택하면 달력 닫기
	$('.ui-state-default').on('click',function(){
		$('#ui-datepicker-div').close();
	});//달력 닫기 끝 
	
	//예약하기 버튼 누르면 예약 내역 alert 띄우기
	$('#submitBtn').on('click',function(){
		if(!result){
			swal('선택하신 시간은 예약가능한 시간이 아닙니다.');
			return false;
		}else{
			swal($('#hos_name').val()+'\n'
					+$('#username').val()+'님'+'\n'
					+$('#category').val()+'\n'
					+$('#re_date').val()+'에    '+$('#re_time').val()+'  예약이 완료되었습니다.').then(function(){
				$('#frm').submit();
				});
			}
		});//예약버튼 누르기 끝 
});//end ready