<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="/hos/resources/css/nav_bar.css" />
<link rel="stylesheet" href="/hos/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="/hos/resources/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/hos/resources/js/nav_bar.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$(document).ready(function() {
		$('body > div.navbar_wrap.fixed-top').removeClass('fixed-top');
		setDateBox();

		
		//저장버튼 수정내용 전송
		$('#modFinishBtn').on('click', function() {

			var now_pw = $('#now_pw').val();
			var new_pw = $('#password').val();
			var new_pw_confirm = $('#passwordConfirm').val();
			var regPassword = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
			
			
			
			if(now_pw != '' && new_pw != '' && new_pw_confirm != ''){
				if (new_pw != new_pw_confirm) {
					swal('비밀번호를 다시 확인해주세요.');
					return false;
				} else if (!regPassword.test(new_pw)) {
					swal("비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
					return false;
				} else {
					$.ajax({
						type : 'POST',
						dataType : 'text',
						url : '/hos/myinfo/updatePassword',
						data : {
							now_pw : now_pw,
							new_pw : new_pw
						},
						success : function(res) {
// 							alert(res);
							if (res == 1) {
								swal({
								     title: "정말 수정하시겠습니까?",
								     text: "YES를 클릭하시면 수정한 내용이 저장됩니다",
								     icon: "warning",
								     buttons: ["NO","YES"],
								}).then((YES) => {
								    if (YES) {
								      /* "YES"클릭시 로직 */
								      $('#frm').submit();
								    } else {
									  return false;
									}
								});

							} else {
								swal('현재 비밀번호를 잘못 입력하셨습니다.');
								return false;
							}
						}
					});

				}
				
 				return false;
			} else if(now_pw != '' || new_pw != '' || new_pw_confirm != ''){
				swal('현재 비밀번호와 수정할 비밀번호, 수정할 비밀번호 확인을 모두 입력해주세요.');
				return false;
			} else{
				swal({
				     title: "정말 수정하시겠습니까?",
				     text: "YES를 클릭하시면 수정한 내용이 저장됩니다",
				     icon: "warning",
				     buttons: ["NO","YES"],
				}).then((YES) => {
				    if (YES) {
				      /* "YES"클릭시 로직 */
				      $('#frm').submit();
				    } else {
					  return false;
					}
				});
				return false;
			}
		});

		//주소 칸 나눠서 보여주기
		var addr = '${sessionScope.memberInfo.address}';
		$('#sample4_postcode').val(addr.split(",")[0]);
		$('#sample4_roadAddress').val(addr.split(",")[1]);
		$('#sample4_detailAddress').val(addr.split(",")[2]);

		//생년월일 셀렉트 박스 선택하기
		var birthday = '${sessionScope.memberInfo.birth}';
		$('#yy').val(birthday.substring(0, 4));
		$('#mm').val(birthday.substring(4, 6));
		$('#dd').val(birthday.substring(6, 8));

		//성별 처리하기
		var gend = '${sessionScope.memberInfo.gender}';

		if (gend == '0') {
			$('#gender').append('남');
		} else if (gend == '1') {
			$('#gender').append('여');
		}
	});

	// select box 연도 , 월 표시
	function setDateBox() {
		var dt = new Date();
		var year = "";
		var com_year = dt.getFullYear();
		// 올해 기준으로 -1년부터 +5년을 보여준다.
		for (var y = (com_year - 99); y <= (com_year + 1); y++) {
			$("#yy")
					.append("<option value='"+ y +"'>" + y + " 년" + "</option>");
		}
		// 월 뿌려주기(1월부터 12월, 1~9월 0추가함)
		var month;
		for (var i = 1; i <= 12; i++) {
			var j = i;

			if (i < 10) {
				j = "0" + i;
			}
			$('#mm').append(new Option(i + "월", j));
		}
		var day;
		for (var d = 1; d <= 31; d++) {
			var f = d;

			if (d < 10) {
				f = "0" + d
			}

			$("#dd").append(new Option(d + " 일", f));
		}
	}
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
					}

				}).open();
	}
	
</script>
<style type="text/css">
#logo{
	margin-top: -50px !important;
}
#myPageWrap {
	text-align: -webkit-center;
}

.profile{ 
	border-bottom: 2px solid #ADDAE6;
} 

/* .content{ */
/* 	background-color: #F8FFFF; */
/* } */

#topTable{
	border-top: 2px solid #ADDAE6;
}
#tableBottom{
	border-bottom: 2px solid #ADDAE6;
}
#myPageBody {
	margin: 0 auto;
}

.bir_wrap {
	display: flex;
}

#modFinishBtn {
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

#modFinishBtn:hover {
  background:#fff;
  color:#000;
  font-weight: bold;
}

#modCancleBtn {
	background: #ADDAE6;
	color: #fff;
	border: none;
	position: relative;
	width: 100px;
	height: 30px;
	font-size: 15px;
	padding: 2px;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	border-radius: 6px;
	font-weight: bold;
}

#modCancleBtn:hover {
	background: #fff;
	color: #007bff;
	font-weight: bold;
}

.myPageList {
	height: 50px;
}

.pwHide {
	text-align: right;
	font-size: 14px;
}

.myicon img {
	width: 40px;
	height: 40px;
	border: 2px solid #e5e5e5;
	border-radius: 50%;
}

#icon {
	width: 100px;
	height: 100px;
}

.myicon {
	text-align: center;
}

ul.nav.nav-tabs {
	background:#fff;
	letter-spacing: -1px;
	height: 50px;
	line-height: 50px;
	width: 100%;
}

ul.nav.nav-tabs li {
	display: inline-block;
	margin-bottom: -2px;
	width: 110px;
	height: 48px;
	margin: 0 auto;
}

ul.nav.nav-tabs li p {
	border: none;
	border-radius: 0px;
	color: #000000;
	margin-right: 5px;
	min-width: 11px;
	display: inline-block;
	text-align: center;
	font-weight: bold;
}
ul.nav.nav-tabs li p:hover{
     color: #E5E5E5;	
}

ul.nav.nav-tabs li:hover {
	background: #fff;
}
</style>
</head>
<body>

  
	<tiles:insertAttribute name="navbar" />

	<div id='myPageWrap'>
		<!-- 네비게이션 바 -->
		<ul class="nav nav-tabs">
			<li class="active" id="nav_memInfo"><a class="mynavA"
				href="/hos/myinfo/memInfo"><p>회원정보수정</p></a></li>
			<li class="active" id="nav_reserList"><a class="mynavA"
				href="/hos/myinfo/myResInfo"><p>진료 내역</p></a></li>
			<li class="active" id="nav_pharmList"><a
				href="/hos/myinfo/myPharmInfo"><p>처방전 내역</p></a></li>
			<li class="active" id="nav_reviewList"><a
				href="/hos/myinfo/myReview"><p>내 병원 후기</p></a></li>
		</ul>
	<div id="myPagebackground">
		<br />
		<p>
		<h3>
			<b>회원 정보</b>
		</h3>
		</p>
		
		<br />
		<form id="frm" name="frm" action="/hos/myinfo/myinfoupdate"
			method="post" enctype="multipart/form-data">
			<table id="myPageBody">
				<tr class="content" id="topTable">
					<!-- 아이콘 -->
					<td class="profile" rowspan="8" width="100px" align="center" style="font-weight:bold;">프로필</td>

					<td class="myicon" colspan="4" align="center">
					<br/>
					<img id="icon" name="profile_image" src="${sessionScope.memberInfo.profile_image}"> <br />
						<br/>
						<input type="file" id="iconSelectBtn" name="filename" type="file"> 
						<input type="hidden" id="user_icon" name="user_icon" /> 
						<input type="hidden" id="user_icon_before" name="user_icon" /></td>
				

				</tr>

				<tr class="content">
					<!-- 아이디 -->
					<td class="myPageList" width="100px" align="center">아이디</td>
					<td id="loginId" colspan="3">
						${sessionScope.memberInfo.username}</td>
				</tr>

				<tr class="content">
					<!-- 이름 -->
					<td class="myPageList" width="100px" align="center">이름</td>
					<td id="loginName" colspan="3">${sessionScope.memberInfo.name}</td>
				</tr>
				<tr class="content">
					<!-- 성별 -->
					<td class="myPageList" width="100px" align="center">성별</td>
					<td id="gender" colspan="3"></td>
				</tr>

				<tr class="content">
					<!-- 비밀번호 -->
					<td class="myPageList" width="150px" align="center">비밀번호</td>
					<td colspan="1">
						<div class="pwHide">
							<p>현재 비밀번호 : &nbsp;</p>
							<p>변경 후 비밀번호 : &nbsp;</p>
							<p>변경 후 비밀번호 확인 : &nbsp;</p>
						</div>
					</td>
					<td>
						<div class="pwHide">
							<p>
								<input type="password" name="now_pw" id="now_pw" style="width: 100%;">
							</p>
							<p>
								<input type="password" name="password" id="password" style="width: 100%;">
							</p>
							<p>
								<input type="password" name="passwordConfirm" id="passwordConfirm" style="width: 100%;">
							</p>
						</div>
					</td>
					<td style="width: 20px;"></td>
				</tr>

				<tr class="content">
					<!-- 생년월일 -->
					<td class="myPageList" width="100px" align="center">생년월일</td>
					<td colspan="2">
						<div class="birthHide">
							<div class="bir_wrap">
								<div class="bir_yy">
									<span class="ps_box"> <select id="yy" name="birth"
										class="sel" aria-label="년" required="required">
											<option value="">년</option>
									</select>
									</span>
								</div>
								&nbsp;&nbsp;
								<div class="bir_mm">
									<span class="ps_box"> <select id="mm" name="birth"
										class="sel" aria-label="월" required="required">
											<option value="">월</option>
									</select>
									</span>
								</div>
								&nbsp;&nbsp;
								<div class=" bir_dd">
									<span class="ps_box"> <select id="dd" name="birth"
										class="sel" aria-label="일" required="required">
											<option value="">일</option>
									</select>
									</span>
								</div>
							</div>
						</div>
					</td>
					<td style="width: 20px;"></td>
				</tr>

				<tr class="content">
					<!-- 주소 -->
					<td class="myPageList" width="100px" align="center">주소</td>
					<td colspan="2">
					<input type='hidden' id='addressInfo' value='${sessionScope.memberInfo.address }' />
					<input type="text" id="sample4_postcode"
						name="address" placeholder="우편번호"> &nbsp;&nbsp;&nbsp; <input
						type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" size="40"
						name="address" placeholder="도로명주소"> <br> <input
						type="text" id="sample4_detailAddress" size="40" name="address"
						placeholder="상세주소"></td>
					<td style="width: 20px;"></td>
				</tr>

				<tr class="content" id="tableBottom">
					<!-- 전화번호 -->
					<td class="myPageList" width="100px" align="center">전화번호</td>
					<td colspan="2"><input type="text" id="phoneText" name="phone"
						class="input_style04" itemname="전화번호" title="전화번호"
						value="${sessionScope.memberInfo.phone}" /></td>
					<td style="width: 20px;"></td>
				</tr>

			</table>
			<br /> <br />
			<div id="finish">
				<input type="hidden" value="${sessionScope.memberInfo.username}"
					name="username" /> <input type="hidden"
					value="${sessionScope.memberInfo.name}" name="name" /> <input
					type="hidden" value="${sessionScope.memberInfo.gender}"
					name="gender" /> <input type="hidden"
					value="${sessionScope.memberInfo.kakao_id}" name="kakao_id" /> <input
					type="hidden" value="${sessionScope.memberInfo.type}" name="type" />
				<input type="hidden" value="${sessionScope.memberInfo.authority}"
					name="authority" /> <input type="hidden"
					value="${sessionScope.memberInfo.enabled}" name="enabled" /> <a
					class="mynavA" href="/hos/myinfo/myinfomain"><input
					type="button" id="modCancleBtn" class="btns" value="뒤로" /></a> 
					<input type="submit" id="modFinishBtn" class="btns" value="저장" />
			</div>
		</form>
		</div>
	</div>
	<tiles:insertAttribute name="footer" />
</body>
</html>