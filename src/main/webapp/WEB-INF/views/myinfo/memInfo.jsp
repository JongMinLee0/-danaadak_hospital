<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
 $(document).ready(function(){
        setDateBox();
    });    
 
    // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-99); y <= (com_year+1); y++){
            $("#yy").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
        // 월 뿌려주기(1월부터 12월)
        var month;
        for(var i = 1; i <= 12; i++){
            $("#mm").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
        }
        var day;
        for(var d = 1; d <= 31; d++){
            $("#dd").append("<option value='"+ d +"'>"+ d + " 일" +"</option>");
        }
    }
    function sample4_execDaumPostcode() {
    	new daum.Postcode({
        oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
       	 }
   
    }).open();
    }
</script>

<style type="text/css">
#myPageBody {
	border : 1px solid black;
}

.bir_wrap{
	display: flex;
}

</style>
</head>
<body>
	<div id='myPageWrap'>
	<p><h3>회원 정보</h3></p>
	
		<table id="myPageBody" >
			<tr class="content">
				<!-- 아이디 -->
				<td class="profile" rowspan="6" width="100px" align="center">프로필</td>
				<td class="myPageList" width="100px" align="center">아이디</td>
				<td id="loginId" colspan="3">  Danaadak </td>
			</tr>
			
			<tr class="content">
				<!-- 닉네임 -->
				<td class="myPageList" width="100px" align="center">닉네임</td>
				<td id="nickname" width="150px"><span id="nValue">닉네임 받아옴</span></td>
				<td><input type="text" class="nHide" id="nBox" value="${dto.user_nickname}" placeholder="닉네임 변경" style="width:100%;"/></td>
				<td><a href="" id="nChangeBtn" class="chgbtns">변경</a> 
				<a href="" id="nChangeCancleBtn" class="nHide canbtns">취소</a></td>
			</tr>
			
			<tr class="content">
				<!-- 비밀번호 -->
				<td class="myPageList" width="150px" align="center">비밀번호</td>
				<td colspan="1">
					<div class="pwHide">
						<p>현재 비밀번호 :</p>
						<p>변경 후 비밀번호 :</p>
						<p>변경 후 비밀번호 확인 :</p>
					</div>
				</td>
				<td>
					<div class="pwHide">
						<p>
							<input type="password" id="now_pw" style="width:100%;">
						</p>
						<p>
							<input type="password" id="new_pw" style="width:100%;">
						</p>
						<p>
							<input type="password" id="new_pw_confirm" style="width:100%;">
						</p>
					</div>
				</td>
				<td><a href="" id="pwChangeBtn" class="chgbtns">변경</a> <a
					href="" id="pwChangeCancleBtn" class="pwHide canbtns">취소</a></td>
			</tr>
	
			<tr class="content">
				<!-- 생년월일 -->
				<td class="myPageList" width="100px" align="center">생년월일</td>
				<td><span id="birthValue">생년월일 받아옴</span></td>
				<td>
					<div class="birthHide">
						<div class="bir_wrap">
							<div class="bir_yy">
								<span class="ps_box"> <select id="yy" name="yy" class="sel" aria-label="년" required="required">
									<option value="">년</option></select>
								</span>
							</div>
							<div class="bir_mm">
								<span class="ps_box"> <select id="mm" name="mm"	class="sel" aria-label="월" required="required">
									<option value="">월</option></select>
								</span>
							</div>
							<div class=" bir_dd">
								<span class="ps_box"> <select id="dd" name="dd" class="sel" aria-label="일" required="required">
									<option value="">일</option></select>
								</span>
							</div>
						</div>
					</div>
				</td>
				<td><a href="" id="birthChangeBtn" class="chgbtns">변경</a> <a
					href="" id="birthChangeCancleBtn" class="birthHide canbtns">취소</a></td>
			</tr>
			
			<tr class="content">
				<!-- 주소 -->
				<td class="myPageList" width="100px" align="center">주소</td>
				<td colspan="2"><input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<br/>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소">
				</td>
				<td><a href="" id="birthChangeBtn" class="chgbtns">변경</a> <a href="" id="birthChangeCancleBtn" class="birthHide canbtns">취소</a></td>
			</tr>
			
			<tr class="content">
				<!-- 전화번호 -->
				<td class="myPageList" width="100px" align="center">전화번호</td>
				<td colspan="2"><select id="o_hp1" name="o_hp1" class="select_style01" >
	            	<option>없음</option>
	              	<option selected value="010">010</option>
	              	<option value="011">011</option>
	              	<option value="016">016</option>
	              	<option value="017">017</option>
	              	<option value="018">018</option>
	              	<option value="019">019</option>
	              	</select> -
	            	
	            	<input type="text" id="o_hp2" name="o_hp2"  value="0000" class="input_style04" maxLength=4 numeric itemname="휴대폰번호" title="휴대폰 가운데 자리" /> - 
	            	<input type="text" id="o_hp3" name="o_hp3"  value="0002" class="input_style04" maxLength=4 numeric itemname="휴대폰번호" title="휴대폰 마지막 자리" />
				</td>
				<td><a href="" id="birthChangeBtn" class="chgbtns">변경</a> <a href="" id="birthChangeCancleBtn" class="birthHide canbtns">취소</a></td>
			</tr>
			
		</table>
	
		<div id="finish">
			<a href="" id="modCancleBtn" class="canbtns">취소</a> <a href=""
				id="modFinishBtn" class="chgbtns">저장</a>
		</div>
</div>
</body>
</html>