<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<link href="/resources/css/bootstrap/login.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/common/login.js"></script>

</head>

<body>
	<div class="container">
		<img class="logo" src="/resources/images/logo.png">
		<label class="logo-title">Management Syetem</label>
		<form class="form-signin" id="loginForm" action="/authentication" method="post">
			<label for="inputEmail" class="sr-only">ID</label>
			<input type="text" id="memberId" name="memberId" class="form-control" placeholder="ID" required autofocus>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="Password" required onkeypress="checkEnterKey();">
			<div class="checkbox">
				<label>
					<input type="checkbox" name="remember-me-parameter"> 1주일 동안 자동 로그인
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="onClickLoginBtn()">Login</button>
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='/join';">회원가입</button>
		</form>
	</div>
	<!-- /container -->
</body>
</html>
