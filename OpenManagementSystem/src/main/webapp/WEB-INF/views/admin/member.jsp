<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<script type="text/javascript" src="/resources/js/admin/member.js"></script>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		<div class="page-header-custom">
			<span class="page-header-title-custom" style="margin-top: 10px;">회원 관리</span>
			<span class="page-header-btn-write">
				<button type="button" class="btn btn-default" id="insertOpenBtn">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				</button>
			</span>
		</div>
		<hr class="page-header-hr">
		
		<div id="contents">
			<table id="table"></table>
		</div>
		
		<!-- insert modal start -->
		<div id="insertModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원 등록</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="insertForm">
							<div class="form-group">
								<div class="col-sm-2">
									<label>ID</label>
								</div>
								<div class="col-sm-10">
									<div class="input-group">
										<input type="text" class="form-control input-group-lg" id="iMemberId" placeholder="ID를 입력하세요.">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" id="checkIdBtn">Check</button>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>비밀번호</label>
								</div>
								<div class="col-sm-10">
									<input type="password" class="form-control input-group-lg" id="iPassword" placeholder="6자 이상이여야 합니다.">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>이름</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="iMemberName" placeholder="이름을 입력하세요.">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>등급</label>
								</div>
								<div class="col-sm-10">
									<select class="form-control" id="iGradeCode">
										<option value="1001">Admin</option>
										<option value="1002" selected="selected">User</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>법인카드 한도</label>
								</div>
								<div class="col-sm-10">
									<input type="number" class="form-control input-group-lg" id="iCorpCardLimit" placeholder="법인카드 한도를 입력하세요.">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>권한</label>
								</div>
								<div class="col-sm-10 role-group" id="iRoleGroup">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="insertBtn">
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;저장
						</button>
					</div>
				</div>
			</div>
		</div><!-- insert modal end -->
		
		<!-- update modal start -->
		<div id="updateModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원 수정</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="updateForm">
							<div class="form-group">
								<div class="col-sm-2">
									<label>ID</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="uMemberId" disabled="disabled">	
								</div>
							</div>
							<div class="form-group">
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
									<select class="form-control" id="uGradeCode">
										<option value="1001">Admin</option>
										<option value="1002">User</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>법인카드 한도</label>
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
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="updateBtn">
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;수정
						</button>
						<button type="button" class="btn btn-default" id="deleteBtn">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;삭제
						</button>
					</div>
				</div>
			</div>
		</div><!-- update modal end -->
	</div>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
