<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/notice/view.css" />

 <script type="text/javascript">
 	$(document).ready(function(){
 		$('body > div.navbar > div > nav.navbar.transparent.navbar-expand-lg > a').text('');
 		$('body > div.navbar > div > nav.navbar.transparent.navbar-expand-lg > a').append('<img alt="다나앗닥" src="/hos/resources/images/notice/logo.png" id="logo">');
 		$('#list').on('click',listRun);
 		$('#update').on('click',updateRun);
 		$('#delete').on('click',deleteRun);
 	});//end ready
 	
 	function listRun(){
 		$('#frm').attr('action','noticelist').submit();
 	}
 	
 	function updateRun(){
 		$('#frm').attr('action','noticeupdate').submit();
 	}
 	
 	function deleteRun(){
 		$('#frm').attr('action','noticedelete').submit();
 	}
 
 	
 </script>    
</head>
<body>
<div class="navbar"><jsp:include page="/WEB-INF/views/fragments/nav_bar.jsp" /></div>
	<!-- background 이미지 -->
	<img src="/hos/resources/images/notice/bg3.jpeg" class="img-fluid"
		alt="Responsive image">
			<!-- 텍스트 -->
		<div id="text">
			<p id="p">다나앗닥의</br>
			공지사항을 알려드립니다.</p>
		</div>
	<div id="wrap">
	
	<div id="form">
		<%-- <tr>
			<th>조회수</th>
			<td>${dto.readcount }</td>
		</tr> --%>
		
			<div id="subject">${dto.subject }</div>
			<div colspan="3">${dto.content}</div>
	
		<tr>
			<th>파일</th>
			<td colspan="3">
				<c:if test="${!empty dto.upload }">
					<a href="contentdownload?num=${dto.num}">
					${fn:substringAfter(dto.upload,"_")}</a>
				</c:if>		
				<c:if test="${empty dto.upload}">
					<c:out value="첨부파일 없음"/>
				</c:if>
			</td>			
		</tr>
		
	</div>
	</div>
	<form name="frm" id="frm" method="get">
		<input type="hidden" name="num" value="${dto.num}"/>
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage }"/>
		<input type="button" id="list" value="리스트닷" />
		<input type="button" id="update" value="수정"/>
		<input type="button" id="delete" value="삭제"/>
	</form>
	<jsp:include
			page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>