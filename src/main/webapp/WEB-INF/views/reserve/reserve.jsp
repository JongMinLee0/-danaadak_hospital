<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#insertModal {
	width: 100%;
	height: 100%;
	background-color: salmon;
}

.insertHide {
	visibility: hidden;
	width: 0px;
	height: 0px;
}

#insertBtn {
	width: 20%;
	height: 20%;
	background-color: salmon;
}

.insertShow {
	display: block;
	position: absolute;
	/*  top: 150px; */
	left: 200px;
	width: 400px;
	height: 150px;
	z-index: 1000;
	border: 1px solid black;
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">


var urno='';

$(document).ready(function(){
	//예약 모달 숨기기
	$('#insertModal').addClass('insertHide');
	
	//예약버튼 누르면 모달창 가져온다.
	$('#insertBtn').on('click',function(){
		$('#insertModal').removeClass('insertHide');
		$('#insertModal').addClass('insertShow');
		
		//모달 창에 닫기 버튼
		$('#closeBtn').on('click',function(){
			$('#insertModal').removeClass('insertShow');
			$('#modifyModal').addClass('insertHide');
		})
	})//예약버튼 누르기 
	
	var nowDay = new Date().toISOString().substring(0, 10);
	$("#re_date").val(nowDay);
	
	var re_time_array = ['09:00','09:30','10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '14:00','14:30','15:00',
						'15:30', '16:00','16:30','17:00','17:30'];
	$.each(re_time_array,function(index, value){
		  $('#re_time').append(
		  		"<option value="+value+">"+value+"</option>"
		  );
	 });
	
	//예약시간 가능 여부 확인 위한 ajax !!!!
	$('#time_chk').on('click',function(){
		//선택한 예약날짜와 예약시간 받기 
		var sel_time= $('#re_time option:selected').val();
		var sel_date = $('#re_date').val();
		console.log(sel_time,sel_date);
		
		$.ajax({
			type:'GET',
			dataType:'json',
			url : 'check_time?re_time='+sel_time+'&re_date='+sel_date,
			success: function(res){
				if(res==1){
					alert('선택하신 시간은 예약할 수 없습니다.');
				}else{
					alert('선택하신 시간은 예약가능한 시간입니다.');
				}
			}
		});
	});
	
	$(function() {$("#re_date").datepicker(
						{
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
	//날짜 선택하면 달력 닫기
	$('.ui-state-default').on('click',function(){
		$('#ui-datepicker-div').close();
	});
	});
});//end ready
 
</script>
</head>
<body>

	<button id="insertBtn">예약할래유, 나아퍼유</button>


	<form name="frm" id="frm" method="post" action="re_register">
		<!-- Insert Medal-->

		<div id="insertModal">


			<table>
				<tr>
					<th colspan="2"><input type="form-control" type="text"
						id="hos_id" name="hos_id" value="아나파정형외과" readonly="readonly"></th>
				</tr>
				<tr>
					<th>I&nbsp;&nbsp;&nbsp;&nbsp;D</th>
					<td><input type="form-control" type="text" id="id" name="id"></td>
				</tr>
				<!-- 	<tr>
					<th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
					<td><input type="form-control" type="text" id="name"
						name="name" required="required"></td>
				</tr> -->
				<tr>
					<th>진료항목</th>
					<td><input type="form-control" type="text" id="category"
						name="category" required="required"></td>
				</tr>
				<tr>
					<th>진&nbsp;료&nbsp;일</th>
					<td>
						<!-- <input type="date" type="form-control" id="book_date"
						name="book_date"> --> 
						<!-- <input class="w3-input w3-padding-16 w3-border" type="date" placeholder="Date" required name="re_date" id="re_date"> -->
						 <input type="text" id="re_date" name="re_date">
						 <select id="re_time" name="re_time">

						</select> 
					<input type="button" id="time_chk" value="예약가능 시간 확인" />
					</td>
				</tr>

				<!-- <tr>
					<th>진료시간</th>
					<td><input type="time" type="form-control" id="book_time"
						name="book_time" min="09:00" max="18:00"></td>
					</tr>
 -->
				<tr>
					<th>의사선생님께 전달할 메세지</th>
					<td><textarea id="message" name="message"></textarea></td>
				</tr>
			</table>

			<p>
				<button id="submitBtn">예약하기</button>
				<button id="closeBtn">닫기</button>
			</p>
		</div>
	</form>
</body>

</html>