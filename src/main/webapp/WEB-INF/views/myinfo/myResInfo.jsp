<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/nav_bar.css" />
<script src="/hos/resources/js/nav_bar.js"></script>
<script type="text/javascript" src="/hos/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $('body > div.navbar_wrap.fixed-top').removeClass('fixed-top');
  $('.btns').on('click', function() {
	  /* if (confirm("정말 취소하시겠습니까?") == true){    //확인
		  
		  
		  $('form').attr("action","/hos/myinfo/myresCance")
				$.ajax({
				type : 'POST',
				data : $(this).prev('.myResLine').val(),
				url : '/myinfo/myresCancel',
				success : function(res) {
					alert('ㅎㅎ');
				}
		});
		
 	 } else {   //취소
      	return false;
  	} 
	  */
	  var tr = $(this);
      var td = tr.children();

	  alert(tr.text());
  });
  
 
  
  
});
</script>
<style type="text/css">
.myResInfoWrap{
	text-align:-webkit-center;
}

.myResTable{
	width:70%;
	text-align: center;
}

td{
	height: 50px;
}

a{
	text-decoration: none;
}

.resMessDetail{
	text-align : left;
}
ul.nav.nav-tabs {
  letter-spacing:-1px;
  height: 50px;
  line-height:50px;
  width :100%;
}
ul.nav.nav-tabs li {
    display: inline-block;
    margin-bottom:-2px;
    width: 110px;
    height: 50px;
    margin: 0 auto;
}
ul.nav.nav-tabs li p {
      border:none;
      border-radius:0px;
      color:#0000ff;
      margin-right:5px;
      min-width:11px;
      display:inline-block;
      text-align: center;
}

ul.nav.nav-tabs li:hover {
      background:#fff;
      color:#000000;
}

</style>

</head>
<body>
<tiles:insertAttribute name="navbar" />
<div class="myResInfoWrap">
  <!-- 네비게이션 바 -->
  <ul class="nav nav-tabs">
		<li class="active" id="nav_memInfo">
			<a class="mynavA" href="/hos/myinfo/memInfo"><p>회원정보수정</p></a>
		</li><li class="active" id="nav_reserList">
			<a class="mynavA" href="/hos/myinfo/myResInfo"><p>진료 내역</p></a>
		</li><li class="active" id="nav_pharmList">
			<p>처방전 내역</p>
		</li><li class="active" id="nav_reviewList">
			<p>내 병원 후기</p>
		</li>
	</ul>
	
<p><h3>진료 내역</h3></p>
<%-- <form id ="frm" name="frm" action="" method="post"> --%>
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
<!-- 				<input type="hidden"> -->
			</c:if>
			<c:if test="${myres[status.index].hos_id != null}">
				<td class="hosName">${myres[status.index].hosDTO.hos_name}</td>
				<td class="resCate">${myres[status.index].category}</td>
				<td class="resDate">${myres[status.index].re_date}</td>
				<td class="resTime">${myres[status.index].re_time}</td>
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
			<td class="resReview ">
				<input type ="hidden" value="${myres[status.index].hosDTO.hos_name}" name="hos_name" />
				<input type ="hidden" value="${myres[status.index].rno}" name="rno" />
			<c:if test="${myres[status.index].re_state == 0}">
			<input type ="button" class="resCancelBtn btns" value="예약 취소" />
			</c:if>
			<c:if test="${myres[status.index].re_state == 1}">
				<input type ="submit" id="${myres[status.index].rno}" class="resReviewBtn writeBtns" value="후기 작성" 
							onclick="location.href='/hos/comm/reviewWrite?rno=${myres[status.index].rno}&hos_name=${myres[status.index].hosDTO.hos_name}'"/>
			</c:if>
			</td>
			</c:if>
		</tr>
	</c:forEach>
	</tbody>
</table>
<%-- </form> --%>
</div>
<tiles:insertAttribute name="footer" />	
</body>
</html>