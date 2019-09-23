<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/fragments/nav_bar.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/home.css" />
<link rel="stylesheet" href="resources/css/hospital_main.css" />
<script type="text/javascript" src="/hos/resources/js/hospital_main.js"></script>
<script type="text/javascript" src="/hos/resources/js/home.js"></script>


</head>
<body>
<form>
<div id="bookList_Wrap">
	<h2>예약내역</h2>
	<table id="book_list">
			<tr>
			<th>진료 항목</th>
			<th>이름</th>
			<th>전달 메세지</th>
			<th>진료 날짜</th>
			<th>진료 시간</th>
			<th>진료 상태</th>
			</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.category }</td>
				<td>
				<c:url var="path" value="view">
				<c:param name="username" value="${dto.username }"/>
				<c:param name="re_state" value="${dto.re_state}"/>
				<c:param name="hos_id" value="${dto.hos_id}"/>
				<c:param name="re_date" value="${dto.re_date}"/>
				</c:url><a href="${path }">${dto.username }</a>
				</td>
				<td>${dto.message }</td>
				<td>${dto.re_date }</td>
				<td>${dto.re_time }</td>
				<td>
						<c:choose>
								<c:when test="${dto.re_state==0}">
									진료 대기
								</c:when>
								<c:when test="${dto.re_state==1}">
									진료 완료
								</c:when>
							</c:choose> </td>
			</tr>
		</c:forEach>
	</table>
</div>
	</form>
	
	<form id="evn_regi" action="" >
		<input type="button" id="event_regi"value="이벤트 접수하기" >
	</form>	
</body>
	<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</html>