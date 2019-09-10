<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/hos/resources/css/join.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/hos/resources/js/join.js"></script>
<style type="text/css">
.wrapper:after {
	content: "";
	position: absolute;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	opacity: 0.9;
	width: 100%;
	height: 100%;  
	background-image: url(/hos/resources/images/login_back.jpg);
	z-index: -1;
	top: 0;
}

/*--header--*/
.header h1 {
	font-size: 2.8em;
	text-transform: uppercase;
	letter-spacing: 3px;
	color: #fff;
	font-weight: 400;
	margin: 0.5em 0;
	text-align: center;
}

.about-bottom {
	width: 31%;
	margin: 0 auto;
	background: rgba(12, 12, 12, 0.51);
	padding: 3em;
	position: relative;
}

h2.tittle {
	text-align: center;
	font-size: 1.6em;
	text-transform: uppercase;
	letter-spacing: 1px;
	padding: 0 0 1.5em;
	color: #fff;
}

.book-form label {
	font-size: 1em;
	color: #fff;
	display: block;
	font-weight: 500;
	margin-bottom: 0.8em;
	letter-spacing: 3px;
	text-transform: uppercase;
}

.book-form label i {
	font-size: 1em;
	margin-right: 10px;
	color: #2baf2b;
}

.form-date-w3-agileits {
	text-align: left;
}

.book-form input[type="text"], .book-form input[type="email"],
	.book-form input[type="password"] {
	width: 93%;
	color: #fff;
	outline: none;
	font-size: 0.9em;
	line-height: 25px;
	padding: 8px 16px;
	border: 1px solid rgba(242, 186, 46, 1);
	letter-spacing: 1px;
	-webkit-appearance: none;
	margin-bottom: 1.8em;
	background: transparent;
	font-family: 'Cuprum', sans-serif;
	-webkit-box-shadow: inset 0px 0px 4px 0px rgba(242, 186, 46, 1);
	-moz-box-shadow: inset 0px 0px 4px 0px rgba(242, 186, 46, 1));
	box-shadow: inset 0px 0px 4px 0px rgba(242, 186, 46, 1);
}

.book-form form input[type="submit"] {
	text-transform: uppercase;
	background: #ffb310;
	color: #FFFFFF;
	padding: .7em 0em;
	border: none;
	font-size: 1em;
	outline: none;
	width: 34%;
	letter-spacing: 1px;
	font-weight: 600;
	margin-top: 0.5em;
	cursor: pointer;
}

.book-form form input[type="submit"]:hover {
	background: #fff;
	color: #ffb310;
}

.btn {
	text-align: center;
}

</style>

</head>

<body id="register">
	<div class="header">
		<h1>회원가입</h1>
	</div>

	<div class="wrapper">
		<!-- Main -->
		<div class="about-bottom main-agile book-form">
			<h2 class="tittle">Register Here</h2>
			<form action="#" method="post">
				<div class="form-date-w3-agileits">
					<label> Name </label> 
					<input type="text" name="name" placeholder="Your Name" required=""> 
					<label> Email</label> 
					<input type="email" name="email" placeholder="Your Email" required=""> 
					<label> Password </label> 
					<input type="password" name="password" placeholder="Your Password" required="">
					<label> CONFIRM Password </label>
					<input type="password" name="password" placeholder="Confirm Password" required="">
				</div>
				<div class="btn">
					<input type="submit" value="Register">
				</div>
			</form>
		</div>
		<!-- //Main -->
	</div>
</body>
</html>