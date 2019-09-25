<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hos/resources/css/com_write.css" />
<script type="text/javascript" src="/hos/resources/js/com_write.js"></script>
<script type="text/javascript" src="/hos/resources/smartEditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<div id="write_wrap">
	<form id="frm" name="frm" action="comm/reviewWrite" method="post">
		<table id="write_table">
			<tr>
				<td>
					제목
				</td>
				<td>
					<input type="text" id="title" name="vi_subject" placeholder="후기 제목을 입력하세요"/>
				</td>
			</tr>
			<tr>
				<td>
					해시태그
				</td>
				<td>
					<input type="text" id="hashTag" name="vi_hash" placeholder="태그를 입력하세요"/>
				</td>
			</tr>
			<tr>
				<td>
					별점
				</td>
				<td>
					<p id="star_grade">
				        <a href="#">★</a>
				        <a href="#">★</a>
				        <a href="#">★</a>
				        <a href="#">★</a>
				        <a href="#">★</a>
					</p>
					<input type="hidden" id="vi_star" name="vi_star" value="" />
					<input type="hidden" id="rno" name="rno" value="" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<textarea id="smart" name="vi_content" style="width: 700px !important;height: 500px"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" id="subBtn" class="write_button">저장</button>
					<button type="button" id="backBtn" class="write_button" onclick="location.href='/hos/comm/review'">뒤로</button>
				</td>
			</tr>
		</table>
	</form>
</div>