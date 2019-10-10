<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/hos/resources/css/admin_event.css" />

<div id="hos_join">
<h1 id="admin_h">병원 회원 가입 요청 리스트</h1>
	<ul id="admin_ul">
		<c:forEach items="${hsList}" var="dto" varStatus="status">
			<li class="joinList">
				<form name="admin_frm" id="${dto.hos_id}" action="/hos/admin/hos_join" method="post">
					<table>
						<tr>
							<td colspan="2"><h4 class="joinList">병원 이름 : ${dto.hosDTO.hos_name}</h4></td>
						</tr>
						<tr>
							<td>병원 주소 :
								${dto.hosDTO.hos_address}&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>분류 : ${dto.hosDTO.hos_category_name}</td>
						</tr>
						<tr>
							<td>병원 계정 : ${dto.username}&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="hidden" name="username" value="${dto.username}" /></td>
							<td>병원 코드 : ${dto.hos_id}</td>
						</tr>
						<tr>
							<td>담당자 : ${dto.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>연락처: ${dto.phone}</td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: right;"><input name="hosjoin" type="submit"
								value="승인" class="${dto.hos_id}"/></td>
						</tr>
					</table>
				</form>
				<hr />
			</li>
		</c:forEach>
	</ul>
</div>