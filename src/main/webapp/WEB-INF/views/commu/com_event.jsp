<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/hos/resources/js/com_event.js"></script>
 <link rel="stylesheet" href="/hos/resources/css/com_event.css" />

    <div id="event_topimage">
		<div id="description1_write">
		<br /><br /><br /><br /><br />
		<p><strong>이벤트</strong>를 둘러보고</p>
		<p><strong>병원</strong>에 <strong>방문</strong>해보세요.</p>
	</div>
</div>
<form>
	<c:forEach items="${eList}" var="dto">
	<div class="card border-secondary mb-3" id="body_List">
		<div class="card-header">${dto.hos_name}</div>
		<div class="event-body text-secondary">
			<p class="event_text">
			<p class="event_text">${dto.e_subject}</p>
			<p class="event_text"><a href="${dto.e_url}" class="cite">사이트로 바로가기</a></p>
			<p class="event_text">${dto.e_content}</p>
		</div>
	</div>
	</c:forEach>
	
	<div class="paging">
				<!--  이전 시작 -->
				<c:if test="${pd.startPage>1 }">
					<a href="event?currPage=${pd.startPage-pd.blockPage }">이전</a>
				</c:if>
				<!-- 이전 끝 -->

				<!-- 페이지 출력 시작 -->
				<c:forEach var="i" begin="${pd.startPage}" end="${pd.endPage}">
					<span><c:url var="cu" value="event">
							<c:param name="currPage" value="${i}" />
							<c:out value="${i }" />
						</c:url>
						<c:choose>
							<c:when test="${i==pd.currPage && i<=pd.totalpage}">
								 <c:out value="${i}" />
							</c:when>
							<c:when test="${i!=pd.currPage && i<=pd.totalpage}">
								<a href="${cu}"><c:out value="${i}" /></a>
							</c:when>
						</c:choose> </span>
				</c:forEach>
				<!-- 페이지  출력 끝-->

				<!-- 다음 시작 -->
				<c:if test="${pd.totalpage > pd.endPage}">
					<a href="event?currPage=${pd.startPage+pd.blockPage}">다음</a>
				</c:if>
				<!-- 다음끝 -->
			</div>
	
</form>