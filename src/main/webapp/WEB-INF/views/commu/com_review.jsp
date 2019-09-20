<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/hos/resources/css/com_review.css" />
<script src="/hos/resources/js/comm_review.js"></script>
<button id="reviewBtn" onclick="location.href='/hos/comm/reviewWrite'">후기작성</button>
<div id="review_description">
	리뷰에 페이지에 대한 설명입니다!!
</div>
<div id="hashTag">
	<c:forEach items="${hList}" var="hdto">
		<span><a href="#" class="badge badge-primary">#${hdto}</a></span>
	</c:forEach>
</div>
<ul>
	<c:forEach items="${rList}" var="rdto">  
		<li>
			<a class="list_link" href="/hos/comm/reviewDetail?vino=${rdto.vino}">
				<table>
					<tr>
						<td><h4>${rdto.name}</h4></td>
						<td><button>1:1대화</button></td>
					</tr>
					<tr>
						<td style="color:orange">
							<c:forEach var="i" begin="1" end="${rdto.vi_star}" step="1">
								★
							</c:forEach>
						</td>
						<td>${rdto.vi_date}</td>
					</tr>
					<tr>
						<td>${rdto.vi_hash}</td>
						<td style="text-align: center">${rdto.hos_name}</td>
					</tr>
					<tr><td><p> </p></td></tr>
					<tr>
						<td>${rdto.vi_subject}</td>
					</tr>
				</table>
			</a>
			<hr />
		</li>
	</c:forEach>
</ul>