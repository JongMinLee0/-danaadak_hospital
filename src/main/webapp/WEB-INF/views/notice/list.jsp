<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pagelist a{
	text-decoration: none;
	color: black;
}
.pagelist a:hover, .pagelist .pagecolor{
	text-decoration: underline;
	color: red;
}
</style>
</head>
<body>
	<form id="frm" name="frm" method="get" action="noticewrite">
		<input type="submit" id="btnWrite" value="글쓰기닷">
	</form>
	
	<div di="bodywrap">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th width="20%">글쓴이</th>
				<th>조회수</th>
			</tr>	
				
			<c:forEach var="dto" items="${aList}">
				<tr>
					<td>${dto.num}</td>
					<td><c:url var="path" value="noticeview">
						<c:param name="currentPage" value="${pg.currentPage }"/>
						<c:param name="num" value="${dto.num }"/>
						</c:url>
						<a href="${path }">${dto.subject }</a></td>
					<td>${dto.writer }</td>
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
					<c:param name="currentPage" value="${i}"/>
				</c:url>
				<c:choose>
					<c:when test="${i==pg.currentPage }">
						<a href="${currPage }" class="pagecolor">
						<c:out value="${i }"/>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${currPage }"><c:out value="${i }"/></a>
					</c:otherwise>
				</c:choose>
				</span>
			</c:forEach>
			<!-- 페이지  출력 끝-->
			
			<!-- 다음 시작 -->
			<c:if test="${pg.totalPage>pg.endPage}">
				<a href="noticelist?currentPage=${pg.startPage+pg.blockPage}">다음</a>
			</c:if>		
			<!-- 다음끝 -->	
		</div>
		
	</div>
</body>
</html>