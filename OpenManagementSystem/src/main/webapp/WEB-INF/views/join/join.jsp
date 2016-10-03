<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<script type="text/javascript" src="/resources/js/service/join.js"></script>

</head>

<body>
	<span id="tx"></span>
	<span id="ty"></span>
	<div class="container">
		<div class="page-header">
			<h3>회원가입</h3>
		</div>
		
		<form class="form-horizontal" id="joinForm" action="/join" method="post">
			<!-- ID -->
			<div class="form-group">
				<label for="id" class="col-sm-2 control-label">ID</label>
				<div class="col-sm-10">
					<div class="input-group">
						<input type="text" id="id" name="id" class="form-control" placeholder="ID를 입력하세요" onkeydown="onChangeId();">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" onclick="onClickCheckId();">Check</button>
						</span>
					</div>
				</div>
			</div>
			
			<!-- Password -->
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요">
				</div>
			</div>
			
			<!-- Nickname -->
			<div class="form-group">
				<label for="nickname" class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-10">
					<div class="input-group">
						<input type="text" id="nickname" name="nickname" class="form-control" placeholder="닉네임을 입력하세요" onkeydown="onChangeNickname();">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" onclick="onClickCheckNickname();">Check</button>
						</span>
					</div>
				</div>
			</div>
			
			<!-- 서명 -->
<!-- 			<div class="form-group"> -->
<!-- 				<label for="sign" class="col-sm-2 control-label">서명</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<div class="input-group"> -->
<!-- 						<canvas id="signCanvas" width="100" height="100" style="border: 1px solid black;"></canvas> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			<!-- Button -->
			<div class="form-group" align="center">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-default" onclick="onClickJoinBtn();">회원가입</button>
					<button type="button" class="btn btn-default" onclick="history.back();">뒤로가기</button>
				</div>
			</div>
		</form>
	</div>
	<!-- /container -->
</body>
</html>
