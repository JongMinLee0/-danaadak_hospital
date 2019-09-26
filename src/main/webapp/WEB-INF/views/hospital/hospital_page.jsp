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
<!-- 애니메이션 -->
<link rel="stylesheet" href="resources/css/animate.css">
<script type="text/javascript" src="/hos/resources/js/wow.min.js"></script>

<script> new WOW().init(); </script>

</head>
<body>
<form>
<div id="bookList_Wrap">
	<span id="title" >예약내역</span>
	
	<table id="book_list">
			<tr>
			<th>예약 번호</th>
			<th>진료 항목</th>
			<th>이름</th>
			<th>전달 메세지</th>
			<th>진료 날짜</th>
			<th>진료 시간</th>
			<th>진료 상태</th>
			</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.rno }</td>
				<td>${dto.category }</td>
				<td>
				<c:url var="path" value="view">
					<c:param name="rno" value="${dto.rno }"/>
					<c:param name="username" value="${dto.username}"/>
					<c:param name="re_state" value="${dto.re_state}"/>
					<c:param name="hos_id" value="${dto.hos_id}"/>
					<c:param name="re_date" value="${dto.re_date}"/>
					<c:param name="re_time" value="${dto.re_time}"/>
				</c:url><a href="${path}">${dto.username }</a>
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
	</form>	
	<div id="event_wrap">
		<input type="button" class="wow shake"id="event_regi"value="이벤트 접수하기" >
			<span id="eventTop">우리 병원이 신청한 이벤트 내역</span>
		<table id="eventListTable">
			<tr>
				<th>이벤트 번호</th>
				<th>종류</th>
				<th>이벤트 제목 </th>
				<th>주&nbsp;&nbsp;&nbsp;소</th>
			</tr>
			<c:forEach var="edto" items="${edto }">
				<tr>
					<td>${edto.eno }</td>
					<td>${edto.e_type }</td>
					<td>${edto.e_subject }</td>
					<td>${edto.e_url }</td>
				</tr>
			 
			</c:forEach>
			
		</table>
	</div>
</body>
	<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</html>