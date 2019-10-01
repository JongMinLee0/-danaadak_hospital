<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
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
});
</script>
<style type="text/css">
.myReviewWrap{
	text-align:-webkit-center;
}

#logo{
	margin-top: -50px !important;
}

/* 표 전체 크기 정렬 */
.myReviewTable{
	width:70%;
	text-align: center;
}

/* 후기글 제목 왼쪽 정렬 */
.revTitleDetail{
	text-align : left;
}
.revTitleLink{
	color:#000;
}
.revTitleLink:hover {
	color :#3D6AF2;
	font-weight: bold;
}


/* 표 타이틀 디자인 */
th {
	border-bottom: 2px solid #000;
	background-color: rgba(201,223,242, 0.3);
	height: 50px;
}

.revTitle a {
 text-decoration: none;
}

td{
	height: 50px;
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
<tiles:insertAttribute name="navbar" />
<div class="myReviewWrap">
  <!-- 네비게이션 바 -->
  <ul class="nav nav-tabs">
		<li class="active" id="nav_memInfo">
			<a href="/hos/myinfo/memInfo"><p>회원정보수정</p></a>
		</li><li class="active" id="nav_reserList">
			<a href="/hos/myinfo/myResInfo"><p>진료 내역</p></a>
		</li><li class="active" id="nav_pharmList">
			<a href="/hos/myinfo/myPharmInfo"><p>처방전 내역</p>
		</li><li class="active" id="nav_reviewList">
			<a href="/hos/myinfo/myReview"><p>내 병원 후기</p></a>
		</li>
	</ul>

<br/>
<p><h3><b>내 리뷰 보기</b></h3></p>
<br/>
<br/>
<table class="myReviewTable">
	<tr>
		<th scope="col" class="hosName" style="width:15%;"><span>병원이름</span></th>				
		<th scope="col" class="hosDate" style="width:10%;"><span>진료일</span></th>				
		<th scope="col" class="revTitle" style="width:55%;"><span>리뷰제목</span></th>
		<th scope="col" class="revStar" style="width:10%;"><span>별점</span></th>
		<th scope="col" class="revDate" style="width:10%;"><span>작성일</span>
		<input type="hidden" name="username" value="${sessionScope.memberInfo.username}" />
		</th>
	</tr>

	<c:forEach var="myreviewList" items="${myReview}" varStatus="status">
	  <tr>
		<td class="hosName" name="hos_name">${myreviewList.hos_name}</td>
		<td class="hosDate">${myreviewList.reserveDTO.re_date}</td>
		<td class="revTitle revTitleDetail" name="vi_subject"><span class="revTitleLink" onclick="location.href='/hos/comm/reviewDetail?vino=${myreviewList.vino}'">${myreviewList.vi_subject}</span></td>
		<td class="revStar" name="vi_star">
		  <c:forEach var="i" begin="1" end="${myreviewList.vi_star}" step="1">
												★
		  </c:forEach></td>
		<td class="revDate" name="vi_date">${myreviewList.vi_date}</td>
	  </tr>
	</c:forEach> 

</table>	

<br/>
<a href ="/hos/myinfo/myinfomain"><input type="button" id="backBtn" value="이전" class="btns"></a>
</div>
<tiles:insertAttribute name="footer" />	
</body>
</html>