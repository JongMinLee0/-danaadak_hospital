<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="/hos/resources/css/nav_bar.css" />
<script src="/hos/resources/js/nav_bar.js"></script>
<!--
	공통 navbar
 -->
<div class="navbar_wrap fixed-top">
	<nav class="navbar navbar-expand-sm">
		<div class="mr-auto"></div>
		<ul class="navbar-nav">
			<li class="nav-item-top"><a class="nav-link" href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
			<li class="nav-item-top"><a class="nav-link" href="#"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a></li>
		</ul>
	</nav>
	<nav class="navbar transparent navbar-expand-lg">
			<!-- link home으로 변경  -->
			
			<a class="navbar-brand" href="/hos/home">다나았닥!!</a> 
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
	
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/hos/map">병원</a></li>
				<li class="nav-item"><a class="nav-link" href="/hos/phmap">약국</a></li>
				<li class="nav-item"><a class="nav-link" href="/hos/comm/main">커뮤니티</a></li>
				<li class="nav-item"><a class="nav-link" href="/hos/noticelist">공지사항</a></li>
			</ul>
			
			<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
				<p>관리자접속중</p>
			</sec:authorize> --%>
			<span>${sessionScope.memberInfo.name}</span>
			<sec:authorize access="isAnonymous()"><button class="btn my-2 my-sm-0" type="submit" onClick="location.href='/hos/login'">로그인</button></sec:authorize>
			<sec:authorize access="isAuthenticated()"><form:form action="${pageContext.request.contextPath}/logout" method="POST"> <button class="btn my-2 my-sm-0" type="submit">로그아웃</button> </form:form> </sec:authorize>

			
			
		</div>
	</nav>
</div>