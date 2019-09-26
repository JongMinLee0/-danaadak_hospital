<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/hos/resources/css/hospital_event.css"/>
<script type="text/javascript" src="/hos/resources/smartEditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" src="/hos/resources/js/hospital_event.js"></script>
</head>
<body>
	<form id="event_registerFrm" action="event_registerPro" method="post">
		<table id="event_tab">
			<tr>
				<td width="20%" align="center">병원 ID</td>
				<td><input type="text" name="hos_id" size="10" maxlength="10" value="${sessionScope.memberInfo.hos_id}"/></td>
			</tr>

			<tr>
				<td align="center">이벤트 제목</td>
				<td><input type="text" name="e_subject" size="40" /></td>
				
			</tr>
			<tr>
				<td align="center">이벤트 종류</td>
				<td><select id="e_type" name="e_type">
						<option value="환급형">환급형</option>
						<option value="상품권">상품권</option>
						<option value="무료체험">무료체험</option>
						<option value="홍보">홍보</option>
				</select></td>
			</tr>
			<tr>
				<td align="center">가격</td>
				<td><input type="text" value="" name="e_price" placeholder="예상하는 가격대를 적어주세요"></td>
			</tr>
			<tr align="center">
				<td width="20%" align="center">이벤트 내용</td>
				<td><textarea id="smart" name="e_content" style="width: 700px !important;height: 500px"></textarea></td>
			</tr>


		</table>

		<input type="button" id="btn_goBack" value="리스트" class="event_register" style="margin-left : 350px;"/> 
		<input type="button"id="subBtn" value="관리자에게 보내기"  class="event_register" style="width : 300px;"/>
	</form>
</body>
</html>