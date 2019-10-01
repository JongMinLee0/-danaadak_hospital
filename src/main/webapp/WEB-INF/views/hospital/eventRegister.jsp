<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/fragments/nav_bar.jsp" />
<title>이벤트 등록</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/home.css" />
<script type="text/javascript" src="/hos/resources/js/home.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/hos/resources/css/hospital_event.css"/>
<script type="text/javascript" src="/hos/resources/smartEditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" src="/hos/resources/js/hospital_event.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<form id="event_registerFrm" action="event_registerPro" method="post">
		<table id="event_tab">
			<tr>
				<th width="20%" align="center">병원 ID</th>
				<td><input type="text" name="hos_id" size="10" maxlength="10" value="${sessionScope.memberInfo.hos_id}"/></td>
			</tr>

			<tr>
				<th width="20%" align="center">이벤트 제목</th>
				<td><input type="text" name="e_subject" size="40" /></td>
				
			</tr>
			<tr>
				<th  width="20%"align="center">이벤트 종류</th>
				<td><select id="e_type" name="e_type">
						<option value="환급형">환급형</option>
						<option value="상품권">상품권</option>
						<option value="무료체험">무료체험</option>
						<option value="홍보">홍보</option>
				</select></td>
			</tr>
			<tr>
				<th  width="20%"align="center">이벤트 주소</th>
				<td><input type="text" value="" name="e_url" placeholder="이동할 페이지 주소"></td>
			</tr>
			<tr align="center">
				<th width="20%" align="center">이벤트 내용</th>
				<td><textarea id="smart" name="e_content" style="width: 700px !important;height: 500px"></textarea></td>
			</tr>


		</table>

		<input type="button" id="btn_goBack" value="리스트" class="event_register" style="margin-left : 350px;"/> 
		<input type="button"id="subBtn" value="관리자에게 보내기"  class="event_register" style="width : 300px;"/>
	</form>
</body>
<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</html>