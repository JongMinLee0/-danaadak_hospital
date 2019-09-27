<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/hos/resources/css/admin_event.css" />

<h1 id="admin_h">개멍청했네</h1>


<!-- e_subject, e_content, e_type, 	e_url, hos_id, hos_name -->
<!-- 제목               내용                 이벤트 방식    타입       병원 코드    병원 이름 -->

	<ul id="admin_h">
		<c:forEach items="${etype_List}" var="aetypelist">
			<li class="joinList">
				<table>
						<tr>
							<td id="red" colspan="2"><h4>${aetypelist.e_subject}</h4></td>
						</tr>
						<tr>
							<td>${aetypelist.e_content}</td>
						</tr>
						<tr>
						<td></td>
							<td style="text-align: right;">${aetypelist.e_type}</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>병원 주소 : -->
<%-- 								${aetypelist.hosDTO.hos_address}&nbsp;&nbsp;&nbsp;&nbsp;</td> --%>
<!-- 							<td>분류 : -->
<%-- 								${aetypelist.hosDTO.hos_category_name}</td> --%>
<!-- 						</tr> -->
<!-- 					<tr> -->
<%-- 						<td>병원 계정 : ${aetypelist.username}&nbsp;&nbsp;&nbsp;&nbsp;</td> --%>
<%-- 						<td>병원 코드 : ${aetypelist.hos_id}</td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<td>담당자 : ${aetypelist.name}&nbsp;&nbsp;&nbsp;&nbsp;</td> --%>
<%-- 						<td>연락처: ${aetypelist.phone}</td> --%>
<!-- 					</tr> -->
				</table>
				<hr />
			</li>
		</c:forEach>
	</ul>



<%-- 	<c:forEach items="${etype_List}" var="aetypelist"> --%>
<!-- 		<h4 style="border: 1px solid"> -->
<%-- 			<h4>${aetypelist.e_subject}</h4> --%>
<%-- 			<h6>${aetypelist.e_content}</h6> --%>
<!-- 			<a href="#userId"><input type="button" id="logchk1" -->
<!-- 				class="btn btn-default" value="상세보기" style="float: right"></a> -->

<!-- 		</h4> -->

<%-- 	</c:forEach> --%>
<!-- </div> -->



<!-- <table> -->
<!-- 	<thead> -->
<!-- 		<th>병원 코드 &emsp;&emsp;&emsp;&emsp;&emsp;</th> -->
<!-- 		<th>병원 이름&emsp;&emsp;&emsp;&emsp;&emsp;</th> -->
<!-- 		<th>이벤트 방식</th> -->
<!-- 		<th></th> -->
<!-- 	</thead> -->
<!-- 	<tbody> -->
<%-- 		<c:forEach items="${etype_List}" var="aetypelist"> --%>
<!-- 			<tr> -->
<%-- 				<td>${aetypelist.hos_id}<input type="text" --%>
<%-- 					value="${aetypelist.hos_id}"></td> --%>
<!-- 				<td><a -->
<%-- 					href="/hos/admin/admin_event_type?hos_id=${aetypelist.hos_id}&e_type=${aetypelist.e_type}">${aetypelist.e_hosDTO.hos_name}</a><input --%>
<%-- 					type="hidden" value="${aetypelist.e_hosDTO.hos_name}"></td> --%>
<!-- 				<td>&emsp;&emsp;&emsp;&emsp;&emsp;</td> -->
<%-- 				<td>${aetypelist.e_type}</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</tbody> -->

<!-- </table> -->
