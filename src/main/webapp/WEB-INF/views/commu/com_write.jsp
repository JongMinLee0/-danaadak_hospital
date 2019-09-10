<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hos/resources/css/com_write.css" />
<script type="text/javascript" src="/hos/resources/js/com_write.js"></script>
<script type="text/javascript" src="/hos/resources/smartEditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<div id="write_wrap">
	<form id="frm">
		<table id="write_table">
			<tr>
				<td>
					제목
				</td>
				<td>
					<input type="text" id="title" name="title" placeholder="후기 제목을 입력하세요"/>
				</td>
			</tr>
			<tr>
				<td>
					해시태그
				</td>
				<td>
					<input type="text" id="hashTag" name="hashTag"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea id="smart" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" id="subBtn" class="write_button">저장</button>
					<button type="button" id="backBtn" class="write_button">뒤로</button>
				</td>
			</tr>
		</table>
	</form>
</div>