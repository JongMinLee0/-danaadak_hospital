<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hos/resources/css/nav_bar.css" />
<script src="/hos/resources/js/nav_bar.js"></script>
<!--
	공통 navbar
 -->
<div class="navbar_wrap fixed-top">
	<nav class="navbar navbar-expand-sm ">
		<div class="mr-auto"></div>
		<ul class="navbar-nav">
			<li class="nav-item-top"><a class="nav-link" href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
			<li class="nav-item-top"><a class="nav-link" href="#"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a></li>
		</ul>
	</nav>
	<nav class="navbar transparent navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="/hos/home">다나았닥!!</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
	
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">병원</a></li>
				<li class="nav-item"><a class="nav-link" href="#">약국</a></li>
				<li class="nav-item"><a class="nav-link" href="/hos/comm/main">커뮤니티</a></li>
				<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
			</ul>
			<button class="btn my-2 my-sm-0" type="submit" onClick="location.href='login/loginForm'">로그인</button>
		</div>
	</nav>
</div>