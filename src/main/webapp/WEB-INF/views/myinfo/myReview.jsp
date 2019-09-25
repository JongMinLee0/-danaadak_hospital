<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
});
</script>
<style type="text/css">
.myReviewWrap{
	text-align:-webkit-center;
}

.myReviewTable{
	width:70%;
	text-align: center;
}

.revTitleDetail{
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

.revTitle a {
 text-decoration: none;
}

td{
	height: 50px;
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
			<p>처방전 내역</p>
		</li><li class="active" id="nav_reviewList">
			<a href="/hos/myinfo/myReview"><p>내 병원 후기</p></a>
		</li>
	</ul>

<br/>
<p><h3><b>내 리뷰 보기</b></h3></p>
<br/>
<br/>
<table class="myReviewTable">
	<thead>
	<tr>
		<th scope="col" class="hosName" style="width:15%;"><span>병원이름</span></th>				
		<th scope="col" class="hosDate" style="width:10%;"><span>진료일</span></th>				
		<th scope="col" class="revTitle" style="width:55%;"><span>리뷰제목</span></th>
		<th scope="col" class="revStar" style="width:10%;"><span>별점</span></th>
		<th scope="col" class="revDate" style="width:10%;"><span>작성일</span></th>
	</tr>
	</thead>
	<tbody class="myResBody">
	  <tr>
		<td class="hosName">MH치과</td>
		<td class="hosDate">2019.09.23</td>
		<td class="revTitle revTitleDetail"><a href="#">원장님이 잘생겼어요</a></td>
		<td class="revStar">★★★★★</td>
		<td class="revDate">2019.09.25</td>
	  </tr>
	</tbody>
</table>	
</div>
<tiles:insertAttribute name="footer" />	
</body>
</html>