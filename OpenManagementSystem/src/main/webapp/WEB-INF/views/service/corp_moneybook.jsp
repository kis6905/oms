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
			<span class="page-header-title-custom" style="margin-top: 10px;">${omsService.title}</span>
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
			
			<div id="excelDownArea">
				<button class="btn btn-success btn-block" type="button" id="excelDownOpenBtn">
					<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>&nbsp;&nbsp;Excel Download
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
						<h4 class="modal-title">사용내역 등록</h4>
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
									<label>사용 장소</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="iUsedPlace">	
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
						<h4 class="modal-title">사용내역 상세 및 수정</h4>
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
									<label>사용 장소</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="uUsedPlace">	
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
					<h4 class="modal-title">서명</h4>
				</div>
				<div class="modal-body center">
					<canvas id="signCanvas" width="300" height="200" style="border: 1px solid black;"></canvas>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="excelDownBtn">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;확인
					</button>
				</div>
			</div>
		</div>
	</div><!-- update modal end -->
	
	<!-- Loading modal start -->
    <div class="modal fade bs-example-modal-sm" id="loadingDialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" style="padding-top: 25%; overflow-y: visible;">
	    <div class="modal-dialog modal-sm">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">
	                    <span class="glyphicon glyphicon-time"></span> Please Wait...
	                 </h4>
	            </div>
	            <div class="modal-body">
	                <div class="progress">
	                    <div class="progress-bar progress-bar-info
	                    progress-bar-striped active"
	                    style="width: 100%">
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div> <!-- Loading modal end -->

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
