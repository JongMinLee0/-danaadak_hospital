<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/hos/resources/css/com_write.css" />
<script type="text/javascript" src="/hos/resources/js/com_modify.js"></script>
<script type="text/javascript" src="/hos/resources/smartEditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<div id="write_wrap">
	<form id="frm" name="frm" action="comm/reviewWrite" method="post">
		<table id="write_table">
			<tr>
				<td>
					제목
				</td>
				<td>
					<input type="text" id="title" name="vi_subject" value="${dList.vi_subject}"/>
				</td>
			</tr>
			<tr>
				<td>
					해시태그
				</td>
				<td>
					<input type="text" id="hashTag" name="vi_hash" value="${dList.vi_hash}"/>
				</td>
			</tr>
			<tr>
				<td>
					별점
				</td>
				<td>
					<p id="star_grade">
						<fmt:parseNumber var="star" type="number" value="${dList.vi_star}" />
						<c:forEach begin="1" end="${star}">
							<a href="#" class="on">★</a>
						</c:forEach>
						<c:forEach begin="1" end="${5 - star}">
							<a href="#">★</a>
						</c:forEach>
				        
					</p>
					<input type="hidden" id="vi_star" name="vi_star" value="${dList.vi_star}" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<span style="display: none" id="modi_content">${dList.vi_content}</span>
					<textarea id="smart" name="vi_content" style="width: 700px !important;height: 500px"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" value="${dList.vino}" id="vino" name="vino" />
					<button type="button" id="subBtn" class="write_button">수정</button>
					<button type="button" id="backBtn" class="write_button" onclick="location.href='/hos/comm/reviewDetail?vino=${dList.vino}'">뒤로</button>
				</td>
			</tr>
		</table>
	</form>
</div>