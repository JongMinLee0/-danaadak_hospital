$(document).ready(function() {
	appendYear();
	
	$('#yy').change(function(){			// 년도 값이 바뀌면
		$('#mm').val("");				// 월 값 초기화
		$('#dd').val("");				// 일 값 초기화
		removeMonth();					// 월 option 비우기
		removeDay();					// 일 option 비우기	
		appendMonth();					// 월 option 생성
	});
	
	$('#mm').change(function(){			// 월 값이 바뀌면
		$('#dd').val("");				// 일 값 초기화
		var day = validDate($('#yy').val(), $('#mm').val());
		removeDay();
		appendDay(day);
	});
	
	
	var year = $('#yy').val();
	var month = $('#mm').val();
	var day = $('#dd').val();
		
});

//option 추가 new Option("option text", "value");
function appendYear() {
	var date = new Date();
	var year = date.getFullYear();

	for(var i=year;i>=1900;i--) {
		$('#yy').append(new Option(i+"년",i));                        
	}
}

function appendMonth() {
	for(var i=1;i<=12;i++){
		$('#mm').append(new Option(i+"월",i));
	}
}

function removeMonth() {
	$("#mm.sel option:gt(0)").remove();
}


function validDate(year, month) {		// 유효한 날짜값만 가져오는 함수
    var monthArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var day;
    if(month !== "2" && $.isNumeric(month)) {	
        day = monthArr[Number(month) - 1];
    }
    else {
        if($.isNumeric(year)) {
            var intYear = Number(year);
            if((intYear%4 === 0 && intYear%100 !== 0) || intYear%400 === 0) {		// 윤년이면
                day = 29;
            }
            else {																	// 평년이면
                day = 28;
            }
        }
        else {
            day = 31;
        }
    }
    return day;
};

function appendDay(day) {
	for(var i=1;i<=day;i++) {
		$('#dd').append(new Option(i+"일",i));
	}
} 

function removeDay() {
	$("#dd.sel option:gt(0)").remove();
}



function execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("roadAddress").value = roadAddr;

				}
			}).open();
}

function phoneAuth(){
	$('#phone_number').prop('disabled', 'disabled');
	
    var url = "phone";
    var name = "phone auth";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
}
