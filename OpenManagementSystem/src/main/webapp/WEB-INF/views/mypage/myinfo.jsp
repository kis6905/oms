<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<script type="text/javascript" src="/resources/js/mypage/myinfo.js"></script>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		<div class="page-header-custom">
			<span class="page-header-title-custom" style="margin-top: 10px;">내 정보</span>
		</div>
		<hr class="page-header-hr">
		
		<div id="contents">
			<form class="form-horizontal" id="updateForm">
				<div class="form-group">
					<div class="col-sm-2">
						<label>ID</label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control input-group-lg" id="uMemberId" disabled="disabled">	
					</div>
				</div>
				<div class="form-group has-warning">
					<div class="col-sm-2">
						<label>비밀번호</label>
					</div>
					<div class="col-sm-10">
						<input type="password" class="form-control input-group-lg" id="uPassword" placeholder="미 입력 시 변경되지 않습니다.">	
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label>이름</label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control input-group-lg" id="uMemberName" placeholder="이름을 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label>등급</label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control input-group-lg" id="uGradeCode" disabled="disabled">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label>법카 한도</label>
					</div>
					<div class="col-sm-10">
						<input type="number" class="form-control input-group-lg" id="uCorpCardLimit" placeholder="법인카드 한도를 입력하세요.">	
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label>권한</label>
					</div>
					<div class="col-sm-10 role-group" id="uRoleGroup">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label>접속일시</label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control input-group-lg" id="uLastLoginDate" disabled="disabled">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label>등록일시</label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control input-group-lg" id="uRegisteredDate" disabled="disabled">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label>수정일시</label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control input-group-lg" id="uModifiedDate" disabled="disabled">
					</div>
				</div>
			</form>
			<div class="form-btn-right">
				<button type="button" class="btn btn-default" id="updateBtn">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;수정
				</button>
				<button type="button" class="btn btn-default" id="cancelBtn">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;취소
				</button>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
