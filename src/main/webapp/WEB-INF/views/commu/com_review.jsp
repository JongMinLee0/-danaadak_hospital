<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/hos/resources/css/com_review.css" />
<script src="/hos/resources/js/comm_review.js"></script>
<!-- <button id="reviewBtn" onclick="location.href='/hos/comm/reviewWrite'">후기작성</button> -->
<div id="review_description">
	<div id="description_write">
		<br /><br /><br /><br /><br />
		<p><strong>리뷰</strong>를 둘러보고</p>
		<p><strong>작성자</strong>와 <strong>대화</strong>를 통해 </p>
		<p><strong>정보</strong>를 <strong>공유</strong>해보세요.</p>
	</div>
</div>
<div id="hashTag">
		<span><a href="/hos/comm/review" class="badge">#전체</a></span>
	<c:forEach items="${hList}" var="hdto">
		<span><a href="/hos/comm/reviewHash?vi_hash=${hdto}" class="badge">#${hdto}</a></span>
	</c:forEach>
</div>
<input type="hidden" name="vi_hash" id="vi_hash" value="${hash}"/>

	<c:forEach items="${rList}" var="rdto">  
			<a class="list_link" href="/hos/comm/reviewDetail?vi_hash=${hash}&vino=${rdto.vino}">
				<div class="card border-secondary mb-3" >
					<div class="card-header">${rdto.name}</div>
				  	<div class="card-body text-secondary">
				    	<h5 class="card-title" style="font-weight: bold;">${rdto.vi_subject}</h5>
				    		<p class="card-text"><c:forEach var="i" begin="1" end="${rdto.vi_star}" step="1">
												★
											</c:forEach></p>
							<p class="card-text">${rdto.vi_date}</p>
							<p class="card-text">${rdto.vi_hash}</p>
							<p class="card-text">${rdto.hos_name}</p>
  					</div>
				</div>
			</a>
	</c:forEach>
	<div id="top_btn_wrap">
		<i class="fa fa-arrow-up" aria-hidden="true" id="top_btn"></i>
	</div>