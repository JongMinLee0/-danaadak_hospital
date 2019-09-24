<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/notice/view.css" />

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(
								'body > div.navbar > div > nav.navbar.transparent.navbar-expand-lg > a')
								.text('');
						$(
								'body > div.navbar > div > nav.navbar.transparent.navbar-expand-lg > a')
								.append(
										'<img alt="다나앗닥" src="/hos/resources/images/notice/logo.png" id="logo">');
						$('#list').on('click', listRun);
						$('#update').on('click', updateRun);
						$('#delete').on('click', deleteRun);
					});//end ready

	function listRun() {
		$('#frm').attr('action', 'noticelist').submit();
	}

	function updateRun() {
		$('#frm').attr('action', 'noticeupdate').submit();
	}

	function deleteRun() {
		$('#frm').attr('action', 'noticedelete').submit();
	}
</script>
</head>
<body>

	<div class="navbar"><jsp:include
			page="/WEB-INF/views/fragments/nav_bar.jsp" /></div>
	<!-- background 이미지 -->
	<img src="/hos/resources/images/notice/bg3.jpeg" class="img-fluid"
		alt="Responsive image">
	<!-- 텍스트 -->
	<div id="titletext">
		<p id="title">다나앗닥</p>
	</div>
	<div id="wrap">

		<div id="form">
			<div id="text">
				<p id="p">공지사항</p>
			</div>

			<%-- <tr>
			<th>조회수</th>
			<td>${dto.readcount }</td>
		</tr> --%>

			<div id="subject">${dto.subject }</div>

			<div id="file">

				<div id="reg_date">
					<a>등록일&nbsp;&nbsp;</a>
					<fmt:formatDate value="${dto.reg_date }" pattern="yyyy.MM.dd" />
				</div>
				<div id="rc">
					<a>조회수&nbsp;&nbsp;</a>${dto.readcount }</div>
			</div>

			<div id="content">
				<div id="content_text">${dto.content}</div>
			</div>


			<div id="prenext">
			 <div class="prenext_pre"><a id="pre">이전글&nbsp;&nbsp;</a><a
					href="noticeview?currentPage=${currentPage}&num=${prenext[1].num }">${prenext[1].subject }</a></div>
				<div class="prenext_next"><a id="next">다음글&nbsp;&nbsp;</a> <a
					href="noticeview?currentPage=${currentPage}&num=${prenext[0].num }">${prenext[0].subject }</a></div>
			</div>


			<form name="frm" id="frm" method="get">
				<input type="hidden" name="num" value="${dto.num}" /> <input
					type="hidden" name="currentPage" id="currentPage"
					value="${currentPage }" />
				<button type="button" class="btn btn-dark" id="list" value="리스트">목록</button>
				<!-- <input type="button"  value="리스트닷" /> -->

				<input type="button" id="update" value="수정" /> <input type="button"
					id="delete" value="삭제" />
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>