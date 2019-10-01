<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#update').bind('click',updateRun);
		$('#cancel').bind('click',cancelRun);
		$('#back').bind('click',backRun);
		$('[name=content]').val($('[name=content]').val().trim());
		$('[name=content]').val(
				$('[name=content]').val().replace(/<br\s?\/?>/g, "\n"));
	});
	
	function updateRun(){
		$('[name=content]').val(
				$('[name=content]').val().replace(/\n/gi,'<br/>'));
		
		$('#frm').attr('action','noticeupdate').submit();
	}
	
	function cancelRun(){
		$('#subject').val('${dto.subject}');
		$('#content').val('${dto.content}');
		$('[name=content]').val($('[name=content]').val().trim());
		$('[name=content]').val(
				$('[name=content]').val().replace(/<br\s?\/?>/g,"\n"));
	}
	
	function backRun(){
		history.go(-1);
	}
</script>   
<style type="text/css">

table{
	width:80%;
}
</style>
</head>
<body>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data" >
		 <table border="1">
		 	<tr>
		 		<th>글쓴이</th>
		 		<td>${dto.writer}</td>
		 		<th>등록일</th>
		 		<td>${dto.reg_date}</td>
		 	</tr>
		 	
		 	<tr>
		 		<th>제목</th>
		 		<td colspan="3"><input type="text" name="subject" id="subject" value="${dto.subject }"/></td>
		 	</tr>
		 	
		 	<tr>
		 		<th>내용</th>
		 		<td colspan="3"><textarea name="content" rows="13" cols="40">${dto.content}</textarea></td>
		 	</tr>
		 	
		 	<tr>
		 		<th>첨부파일</th>
		 		<td colspan="3"><input type="file" name="filename"/>
		 		<span>${fn:substringAfter(dto.upload,"_") }</span>
		 		</td>
		 	</tr>
		 </table>
		 
		 <input type="hidden" name="num" value="${dto.num }"/>
		 <input type="text" name="currentPage" value="${currentPage }"/>
		 <input type="button" id="update" value="수정"/>
		 <input type="button" id="cancel" value="취소"/>
		 <input type="button" id="back" value="뒤로"/>
	</form>
</body>
</html>