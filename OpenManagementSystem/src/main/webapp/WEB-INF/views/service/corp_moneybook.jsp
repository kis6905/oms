<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<script type="text/javascript" src="/resources/js/service/corp_moneybook.js"></script>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		<div class="page-header-custom">
			<span class="page-header-title-custom" style="margin-top: 10px;">법카 관리</span>
			<span class="page-header-btn-write">
				<button type="button" class="btn btn-default" id="insertOpenBtn">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				</button>
			</span>
		</div>
		<hr class="page-header-hr">
		
		<div id="contents">
			<div class="panel panel-default inquiry">
				<div class="panel-body">
					<div class="form-group">
						<input type="text" id="startDate" class="form-control datepicker" readonly="readonly" placeholder="시작 일">
					</div>
					<div class="form-group">
						<input type="text" id="endDate" class="form-control datepicker" readonly="readonly" placeholder="종료 일">
					</div>
					<button class="btn btn-primary btn-block" type="button" id="inquiryBtn">조회</button>
				</div>
			</div>
			
			<div id="defaultArea">
				<div class="alert alert-warning" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><strong>&nbsp;&nbsp;알림</strong><br>
					서명 하기 &gt; 다운로드 - 결재로 올라가지 않습니다.(관리자 메뉴에서 조회 불가)<br>
					서명 하기 &gt; 결재올리기 - 실제 결재 기능은 없으며, 관리자 메뉴에서 조회 및 Excel 다운로드만 가능합니다.
				</div>
				<div class="alert alert-success" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><strong>&nbsp;&nbsp;알림</strong><br>
					법인카드 초기화 일은 매월 <strong>3일</strong>입니다.<br>
					법인카드 사용 내역 제출 시 <strong>시작일은 3일, 종료일은 다음달 2일</strong>로 설정해 주세요.
				</div>
			</div>
			
			<div id="excelDownArea">
				<button class="btn btn-success btn-block" type="button" id="signOpenBtn">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;서명 하기
				</button>
			</div>
			
			<div class="total-info" id="totalInfoArea">
				<span style="float: left; padding-bottom: 5px;">Total: <span id="totalCnt"></span> 건&nbsp;&nbsp;</span>
				<span style="float: right; padding-bottom: 5px;">
					<span style="color: red;">지출: <span id="payment"></span> 원</span>&nbsp;&nbsp;
					<span style="color: green;">잔액: <span id="balance"></span> 원</span>
				</span>
			</div>
			
			<table id="table"></table>
		</div>
		
		<!-- insert modal start -->
		<div id="insertModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h5 class="modal-title">사용내역 등록</h5>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="insertForm">
							<div class="form-group">
								<div class="col-sm-2">
									<label>사용 일</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg datepicker" readonly="readonly" id="iUsedDate">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>분류</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="iCategory" placeholder="Ex) 식대, 회의, 접대...">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>고객사</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="iCustomer" placeholder="Ex) 팀원, 현대카드, 신한카드...">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>금액</label>
								</div>
								<div class="col-sm-10">
									<input type="number" class="form-control input-group-lg" id="iPrice">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>사용 목적</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="iNote" placeholder="50자 이내로 적어주세요">
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
						<h5 class="modal-title">사용내역 상세 및 수정</h5>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="insertForm">
							<input type="hidden" id="uSeq"></input>
							<div class="form-group">
								<div class="col-sm-2">
									<label>사용 일</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg datepicker" readonly="readonly" id="uUsedDate">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>분류</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="uCategory" placeholder="Ex) 식대, 회의, 접대...">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>고객사</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="uCustomer" placeholder="Ex) 팀원, 현대카드, 신한카드...">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>금액</label>
								</div>
								<div class="col-sm-10">
									<input type="number" class="form-control input-group-lg" id="uPrice">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>사용 목적</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="uNote" placeholder="50자 이내로 적어주세요">
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
	
	<!-- sign modal start -->
	<div id="signModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">서명</h5>
				</div>
				<div class="modal-body center">
					<canvas id="signCanvas" width="300" height="200" style="border: 1px solid black;"></canvas>
					<br>
					<span>&lt; 서명 &gt;</span>
					<div class="form-group has-success">
						<input type="text" id="term" class="form-control" readonly="readonly">
					</div>
					<div class="form-group">
						<input type="text" id="signTitle" class="form-control" placeholder="결재 제목 (Ex: 12월_법인카드사용내역)">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="approvalReqBtn">
						<span class="glyphicon glyphicon-paste" aria-hidden="true"></span>&nbsp;&nbsp;결재요청
					</button>
					<button type="button" class="btn btn-default" id="excelDownBtn">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>&nbsp;&nbsp;다운로드
					</button>
				</div>
			</div>
		</div>
	</div><!-- update modal end -->

	<div id="excelDwonForm"></div>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
