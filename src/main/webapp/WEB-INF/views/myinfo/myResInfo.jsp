<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/nav_bar.css" />
<link rel="stylesheet" href="/hos/resources/css/myResInfo.css" />
<script src="/hos/resources/js/nav_bar.js"></script>
<script type="text/javascript" src="/hos/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $('body > div.navbar_wrap.fixed-top').removeClass('fixed-top');
  
  /* 예약 취소 버튼  */
  $('.myResTable .myResBody td.resReview input.resCancelBtn.btns').on('click', function(){
	  
	  var rno = $(this).prev().val();
	  $.ajax({
		  type:'POST',
		  url:'/hos/cancel?rno='+rno,
			success:function(res){
					swal(res).then((value) => {
						location.href='/hos/myinfo/myResInfo';
					  });
				},error:function(res){
					swal(res);
				}
			}); 
	  
  });

});
</script>

</head>
<body>
<tiles:insertAttribute name="navbar" />
<div class="myResInfoWrap">
  <!-- 네비게이션 바 -->
  <ul class="nav nav-tabs">
		<li class="active" id="nav_memInfo">
			<a href="/hos/myinfo/memInfo"><p>회원정보수정</p></a>
		</li><li class="active" id="nav_reserList">
			<a href="/hos/myinfo/myResInfo"><p>진료 내역</p></a>
		</li><li class="active" id="nav_pharmList">
			<a href="/hos/myinfo/myPharmInfo"><p>처방전 내역</p></a>
		</li><li class="active" id="nav_reviewList">
			<a href="/hos/myinfo/myReview"><p>내 병원 후기</p></a>
		</li>
	</ul>
	
<br/>	
<p><h3><b>진료 내역</b></h3></p>
<br/>
<br/>
<%-- <form id ="frm" name="frm" action="/myinfo/myresCancel" method="post"> --%>
<table class="myResTable">
	<thead>
	<tr>
		<th scope="col" class="hosName" style="width:15%;"><span>병원이름</span></th>				
		<th scope="col" class="resCate" style="width:10%;"><span>진료항목</span></th>				
		<th scope="col" class="resDate" style="width:10%;"><span>예약일</span></th>
		<th scope="col" class="resTime" style="width:10%;"><span>예약 시간</span></th>
		<th scope="col" class="resState" style="width:10%;"><span>예약 상태</span></th>
		<th scope="col" class="resMess" style="width:25%;"><span>남기는 메시지</span></th>
		<th scope="col" class="resReview" style="width:10%;"><span>후기 작성</span></th>
		
	</tr>
	</thead>
	<tbody class="myResBody">
	<c:forEach var="myresList" items="${myres}" varStatus="status" begin="0">
		<c:set var="i" value="0" />
		<tr class="myResLine" id="${myresList.rno}" value="${myresList.rno}">
			<c:if test="${myres[status.index].hos_id == null}">
		<!-- 	<input type="hidden"> -->
			</c:if>
			
			<c:if test="${myres[status.index].rno != null}">
				<td class="hosName">${myres[status.index].hosDTO.hos_name}</td>
				<td class="resCate">${myres[status.index].category}</td>
				<td class="resDate">${myres[status.index].re_date}</td>
				<td class="resTime">${myres[status.index].re_time}</td>
<%-- 				<td><input type="text" value="너의 rno번호:${myres[status.index].rno }"></td> --%>
<%-- <td><input type="text" value="asd${myRevBtn[status.index].rno }"></td> --%>
				<td class="resState resStateTd">
			<c:if test="${myres[status.index].re_state == 0}">
			예약 중
			</c:if>
			<c:if test="${myres[status.index].re_state == 1}">
			진료 완료
			</c:if>
			<c:if test="${myres[status.index].re_state == 2}">
			예약 취소
			</c:if></td>
			<td class="resMess resMessDetail">${myres[status.index].message}</td>
			<td class="resReview">
 				<input type ="hidden" value="${myres[status.index].hosDTO.hos_name}" name="hos_name" />

			  <c:if test="${myres[status.index].re_state == 0}">
			  	<input type ="hidden" value="${myres[status.index].rno}" name="rno" />
			    <input type ="button" class="resCancelBtn btns" value="예약 취소"/>
			  </c:if>
			  <c:if test="${myres[status.index].re_state == 1}">
<%-- 					<c:choose> --%>
<%--  					  <c:when test="${empty myRevBtn.rno}"> --%>
					<!-- myRevBtn : rno가 저장되어 있는 List num이 rno이다. -->
					<c:set var="doneLoop" value="false" />
					<c:forEach items="${myRevBtn}" var="num">
						<c:if test="${not doneLoop}">
							<c:choose>
								<c:when test="${myres[status.index].rno == num}">
									<c:set var="result" value="true" />
									<c:set var="doneLoop" value="true" />
								</c:when>
								<c:otherwise>
									<c:set var="result" value="false" />
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
					<c:choose>
						<c:when test="${result}">
							<span>후기작성완료</span>
						</c:when>
						<c:otherwise>
							<input type ="submit" id="${myres[status.index].rno}" class="resReviewBtn writeBtns btns" value="후기 작성" 
								onclick="location.href='/hos/comm/reviewWrite?rno=${myres[status.index].rno}&hos_name=${myres[status.index].hosDTO.hos_name}'"/>
						</c:otherwise>
					</c:choose>
			</c:if>
			<c:if test="${myres[status.index].re_state == 2}">
				<span>예약취소완료</span>
			</c:if>
			</td>
			
			 </c:if>
		</tr>
	</c:forEach>
	</tbody>
</table>
<%-- </form> --%>
<br/>

<a href ="/hos/myinfo/myinfomain"><input type="button" id="backBtn" value="이전" class="btns"></a>
</div>
<tiles:insertAttribute name="footer" />	
</body>
</html>