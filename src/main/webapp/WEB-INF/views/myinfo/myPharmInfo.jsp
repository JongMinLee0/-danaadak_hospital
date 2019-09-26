<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	var medicine = $('.pharmName').val();
	
	alert(medicine);
});
</script>
<style type="text/css">
.myPharmInfoWrap{
	text-align:-webkit-center;
}

.myPharmTable{
	text-align: center;
}
td{
	height: 50px;
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
<!-- navbar 홈페이지 상단 메뉴바  -->
<tiles:insertAttribute name="navbar" />

<div class="myPharmInfoWrap">
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
<p><h3><b>처방전 내역 </b></h3></p>
<br/><br/>
<table class="myPharmTable">
	<thead>
	<tr>
		<th scope="col" class="hosName" style="width:200px;"><span>발급병원</span></th>				
		<th scope="col" class="resDate" style="width:100px;"><span>발급날짜</span></th>				
		<th scope="col" class="pharmName" style="width:100px;"><span>약 이름</span></th>
		<th scope="col" class="pharmQuan" style="width:100px;"><span>1회 복용량</span></th>
		<th scope="col" class="pharmCount" style="width:100px;"><span>1일 복용횟수</span></th>
	</tr>
	</thead>
	<tbody class="myPharmBody">
	<c:forEach var="myPharmList" items="${myres}" varStatus="status">
		<tr class="myPharmLine" id="${myPharmList.rno}" value="${myPharmList.rno}">
			<c:if test="${myres[status.index].medicine == null}">
<!-- 				<input type="hidden"> -->
			</c:if>
			
			<c:if test="${myres[status.index].medicine != null}">
				<td class="hosName">${myres[status.index].hosDTO.hos_name}</td>
				<td class="resDate">${myres[status.index].re_date}</td>
				<td class="pharmName">${myres[status.index].medicine}</td>
				<td class="pharmQuan">${myres[status.index].eat_cnt}</td>
				<td class="pharmCountn">${myres[status.index].eat_cnt}</td>
			</c:if>
			</tr>
	</c:forEach>		
	</tbody>
</table>
</div>
<tiles:insertAttribute name="footer" />	
</body>
</html>