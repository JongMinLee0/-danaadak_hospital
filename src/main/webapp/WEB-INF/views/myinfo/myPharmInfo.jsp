<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<meta charset="UTF-8">
<title>나의 진료 내역</title>
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
    $('.pharmName').val($('.pharmName').val().replace(',','<br/>'));

	
// //	$('.pharmName').each(function() {
// 	var rno = $('.pharmName').attr('id');	
// 	var text = rno.html();
//	alert(text);
// //		$('.pharmName').children().html(text.replace(',', '<br/>'));
// //	});
});
</script>
<style type="text/css">
.myPharmInfoWrap{
	text-align:-webkit-center;
}

.myPharmTable{
	width:70%;
	text-align: center;
}

/* 표 타이틀 디자인 */
th {
	border-bottom: 2px solid #000;
	background-color: rgba(201,223,242, 0.3);
	height: 50px;
}

td{
	height: 80px;
}

/* 버튼 디자인 */
.btns{
  background : #343a40;
  color:#fff;
  border:none;
  position:relative;
  width:100px;
  height:30px;
  font-size:15px;
  padding:2px;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 6px;
  font-weight: bold;
}
.btns:hover{
  background:#fff;
  color:#000;
  font-weight: bold;
}

/* 마이페이지 네비 바 */
ul.nav.nav-tabs {
  background:#fff;	
  letter-spacing:-1px;
  height: 50px;
  line-height:50px;
  width :100%;
}
ul.nav.nav-tabs li {
    display: inline-block;
    margin-bottom:-2px;
    width: 110px;
    height: 48px;
    margin: 0 auto;
}
ul.nav.nav-tabs li p {
      border:none;
      border-radius:0px;
      color:#000000;
      margin-right:5px;
      min-width:11px;
      display:inline-block;
      text-align: center;
      font-weight: bold;
}
ul.nav.nav-tabs li p:hover{
     color: #E5E5E5;	
}
ul.nav.nav-tabs li:hover {
      background:#fff;
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
		<th scope="col" class="hosName" style="width:25%;"><span>발급병원</span></th>				
		<th scope="col" class="resDate" style="width:15%;"><span>발급날짜</span></th>				
		<th scope="col" class="pharmName" style="width:20%;"><span>약 이름</span></th>
		<th scope="col" class="pharmQuan" style="width:20%;"><span>1회 복용량</span></th>
		<th scope="col" class="pharmCount" style="width:20%;"><span>1일 복용횟수</span></th>
	</tr>
	</thead>
	<tbody class="myPharmBody">
	<c:forEach var="myPharmList" items="${myres}" varStatus="status">
		<tr class="myPharmLine" value="${myPharmList.rno}">
			<c:if test="${myres[status.index].medicine == null}">
<!-- 				<input type="hidden"> -->
			</c:if>
			
			<c:if test="${myres[status.index].medicine != null}">
				<td class="hosName">${myres[status.index].hosDTO.hos_name}</td>
				<td class="resDate">${myres[status.index].re_date}</td>
				<td class="pharmName" id="${myPharmList.rno}">
				${fn:replace(myPharmList.medicine, ',', '<br/>') }</td>
				<td class="pharmQuan">
				<c:set var="sp" value="${fn:split(myPharmList.eat_cnt,'/')[0]}"/>
				${fn:replace(sp, ',', '<br/>') }</td>
				<td class="pharmCountn">
				<c:set var="sp2" value="${fn:split(myPharmList.eat_cnt,'/')[1]}"/>
				${fn:replace(sp2, '-', '<br/>') }</td>
			</c:if>
			</tr>
	</c:forEach>		
	</tbody>
</table>
<br/>
<a href ="/hos/myinfo/myinfomain"><input type="button" id="backBtn" value="이전" class="btns"></a>
</div>
<tiles:insertAttribute name="footer" />	
</body>
</html>