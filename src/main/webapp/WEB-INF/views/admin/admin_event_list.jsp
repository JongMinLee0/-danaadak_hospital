<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/hos/resources/css/admin_event.css" />

<h1 id="admin_h">병원 이벤트 리스트</h1>

<table id="admin_h">
	<thead>
		<th>병원 코드 &emsp;&emsp;&emsp;&emsp;&emsp;</th>
		<th>병원 이름&emsp;&emsp;&emsp;&emsp;&emsp;</th>
		<th>&emsp;&emsp;&emsp;&emsp;&emsp;</th>
		<th>이벤트 방식</th>
	</thead>
	<tbody>
		<c:forEach items="${e_List}" var="aelist">
			<form name="etype_frm" id="etype_frm"
				action="/hos/admin/admin_event_type" method="post">
			<tr>
				<td>${aelist.hos_id}<input type="hidden" name="hos_id"
					value="${aelist.hos_id}"></td>
				<td>${aelist.e_hosDTO.hos_name}</td>
				<td>&emsp;&emsp;&emsp;&emsp;&emsp;</td>
				<td><input type="hidden" value="${aelist.e_type}" name="e_type">${aelist.e_type}</td>
				<td><input type="submit" value="타입리스트"></td>
			</tr>
			</form>
		</c:forEach>
	</tbody>

</table>