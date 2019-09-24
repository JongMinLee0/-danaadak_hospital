<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/hos/resources/css/notice/write.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
 <script type="text/javascript" src="/hos/resources/js/notice_write.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/hos/resources/smartEditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
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

	<form name="frm" id="frm" method="post" enctype="multipart/form-data">


		<div id="bodywrap">

			<div id="form">
				
				<div id="subject">
					제목&emsp;&emsp;
					<input type="text" name="subject"  />
				</div>

				<div id="content">
					내용</br>
					<div>
					<textarea id="smart" name="content" style="width: 700px !important;height: 500px"></textarea>
				</div>
				</div>

				<!-- <div>	
					첨부파일 <input type="file" name="filename" id="filepath" />
				</div> -->
			</div>
		</div>
		
		<div id="btn">
		<button type="button" class="btn btn-dark" id="btnList" value="리스트">리스트</button>
		<button type="button" class="btn btn-dark" id="btnSave" value="저장">저장</button>
		</div>	
			
	</form>
	<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>