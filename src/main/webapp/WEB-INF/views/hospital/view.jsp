<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:include page="/WEB-INF/views/fragments/nav_bar.jsp" /> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/home.css" />
<script type="text/javascript" src="/hos/resources/js/home.js"></script>
<link rel="stylesheet" href="resources/css/hospital_view.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<!-- hospital_view jquery -->
<script type="text/javascript" src="/hos/resources/js/hospital_view.js"></script>
</head>
<body>
		<!--진료 상태 업데이트   -->
	<form action="re_stateUpdate" method="post" id="re_stateFrm">
	<span id="sub_wrap">환자 진료 및 처방전 부여</span>
	<table>
			<tr>
				<th>환&nbsp;자&nbsp;명</th>
				<th>진료 상태</th>
			</tr>
			<tr>
				<td><input type="text" value="${param.username}"
					name="username" readonly="readonly">
					<input type="hidden" name="hos_id" value="${param.hos_id }"></td>
				<td><input type="radio" name=re_state value="0"checked="checked" /> 진료대기 
					<input type="radio" name=re_state value="1" /> 진료완료</td>
			</tr>
		
		</table>
	</form>	
	<i class="fa fa-pencil-square-o" id="rec_btn">처방전 작성</i>
	<!--처방전 insert  -->
	<div id="insert_modal">
	<span id="rec_top">처방전</span>
		<form id="rec_frm">
			<table id="insert_rec">
				<tr>
					<th>발급일</th> 
					<td><input type="text" value="${param.re_date }" name="re_date">
					<input type="hidden" value="${param.re_time }" name="re_time"></td>
				</tr>
				<tr>
					<th>병원명 </th>
					<td>
						<input type="text" name="hos_id" value="${param.hos_id }"></td>
				</tr>				
				<tr>
					<th>환자명</th>
					<td><input type="text" name="username" value="${param.username }"></td>
				</tr>
				<tr>
					<th>복용 횟수</th>
					<td><input type="text" name="eat_cnt"></td>
				</tr>
				<tr>
				<th>처방 받을 약</th>
				<td><p>	<input type="text" id="first" name="medicine">
					<i class="fa fa-plus" id="add_input"></i></p> </td>
				</tr>
				<tr>
				<td colspan="2">
				<input type="button" id="recipe_ins" value="환자에게 처방전 보내기"/>
				</td>
				</tr>
			</table>
		</form>
	</div>	
	
	
		<!-- 최종 제출 -->
		<input type="button" id="update_reserve" value="제출"/> 
</body>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</html>