<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

 <script type="text/javascript">
 	$(document).ready(function(){
 		
 		 $('#btnList').bind('click',function(){
 			$('#frm').attr('action','noticelist');
 			$('#frm').submit();
 		});
 		
 		$('#btnSave').bind('click',function(){
 			$('[name=content]').val(
 					$('[name=content]').val().replace(/\n/gi,'<br/>'));
 			
 			$('#frm').attr('action','noticewrite').submit();
 		});
 		
 		
 		
 		/* //첨부파일 용량 체크
 		$('#filepath').on('change',function(){
 			if(this.files && this.files[0]){
 				if(this.files[0].size>1000000000){
 					alert("1GB 이하만 첨부할 수 있습니다 .");
 					$('#filepath').val('');
 					return false;
 				}
 			}
 		}); */
 	});

 </script>  
</head>
<body>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td width="20%" align="center">글쓴이</td>
				<td><input type="text" name="writer" size="10" maxlength="10"/></td>
			</tr>
			
			<tr>
				<td width="20%" align="center">제목</td>
				<td><input type="text" name="subject" size="40"/></td>
			</tr>		
				
			<tr>
				<td width="20%" align="center">내용</td>
				<td><textarea name="content" rows="13" cols="40"></textarea></td>
			</tr>
			
			<tr>
				<td width="20%" align="center">첨부파일</td>
				<td><input type="file" name="filename" id="filepath"/></td>
			</tr>		
		</table>
		
		<input type="button" id="btnList" value="리스트"/>
		<input type="button" id="btnSave" value="저장"/>
	</form>
</body>
</html>