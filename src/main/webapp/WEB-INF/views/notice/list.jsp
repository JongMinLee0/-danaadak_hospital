<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/notice/list.css" />
<!-- 애니메이션 -->
<link rel="stylesheet" href="resources/css/animate.css">
<script type="text/javascript" src="/hos/resources/js/wow.min.js"></script>
<script> new WOW().init(); </script>
<script type="text/javascript">
	$(document).ready(function(){
		$('body > div.navbar > div > nav.navbar.transparent.navbar-expand-lg > a').text('');
		$('body > div.navbar > div > nav.navbar.transparent.navbar-expand-lg > a').append('<img alt="다나앗닥" src="/hos/resources/images/notice/logo.png" id="logo">');
	});
</script>
</head>
<body>
	<div class="navbar"><jsp:include
			page="/WEB-INF/views/fragments/nav_bar.jsp" /></div>
			
	<!-- background 이미지 -->
	<img src="/hos/resources/images/notice/bg3.jpeg" class="img-fluid"
		alt="Responsive image">

	
	
	<div id="bodywrap">
		<!-- 텍스트 -->
		<div class="wow fadeInDownBig text">
			<p id="p">다나앗닥의</br>
			공지사항을 알려드립니다.</p>
		</div>
		
		
		<!-- 테이블 -->
		<div id="table_wrap">
			<!-- 글쓰기버튼 -->
			<c:choose>
				<c:when test="${sessionScope.memberInfo.username=='admin' }">
					<form id="frm" name="frm" method="get" action="noticewrite">
						<button type="submit" class="btn btn-dark" id="btnWrite" value="글쓰기">글쓰기</button>
					</form>
				</c:when>
			</c:choose>

			<table class="table table-hover" id="title">
				<thead>
					<tr>
						<th scope="col" width="1%">No</th>
						<th scope="col" width="20%">제목</th>
						<th scope="col" width="2%" align="left">작성시간</th>
						<th scope="col" width="2%">조회수</th>

					</tr>
				</thead>

				<c:forEach var="dto" items="${aList}">
					<tr>
						<td>${dto.num}</td>
						<td><c:url var="path" value="noticeview">
								<c:param name="currentPage" value="${pg.currentPage }" />
								<c:param name="num" value="${dto.num }" />
							</c:url> 
							<a href="${path }" id="subject">${dto.subject }</a></td>
						<td><fmt:formatDate value="${dto.reg_date }"
								pattern="yyyy.MM.dd" /></td>
						<td>${dto.readcount }</td>
					</tr>
				</c:forEach>
			</table>



			<div class="pagelist">
				<!--  이전 시작 -->
				<c:if test="${pg.startPage>1 }">
					<a href="noticelist?currentPage=${pg.startPage-pg.blockPage }">이전</a>
				</c:if>
				<!-- 이전 끝 -->

				<!-- 페이지 출력 시작 -->
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<span><c:url var="currPage" value="noticelist">
							<c:param name="currentPage" value="${i}" />
						</c:url> <c:choose>
							<c:when test="${i==pg.currentPage }">
								<a href="${currPage }" class="pagecolor"> <c:out
										value="${i }" />
								</a>
							</c:when>
							<c:otherwise>
								<a href="${currPage }"><c:out value="${i }" /></a>
							</c:otherwise>
						</c:choose> </span>
				</c:forEach>
				<!-- 페이지  출력 끝-->

				<!-- 다음 시작 -->
				<c:if test="${pg.totalPage>pg.endPage}">
					<a href="noticelist?currentPage=${pg.startPage+pg.blockPage}">다음</a>
				</c:if>
				<!-- 다음끝 -->
			</div>
	

		</div>

	</div>

		
		<jsp:include
			page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>