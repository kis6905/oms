<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<script type="text/javascript" src="/resources/js/service/person_moneybook.js"></script>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		<div class="page-header-custom">
			<span class="page-header-title-custom" style="margin-top: 10px;">지출 관리</span>
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
			
			<div id="signOpenBtnArea">
				<button class="btn btn-success btn-block" type="button" id="signOpenBtn">
					<span class="glyphicon glyphicon-paste" aria-hidden="true"></span>&nbsp;&nbsp;지출결의 결재 올리기
				</button>
			</div>
			
			<div class="total-info" id="totalInfoArea">
				<span style="float: left; padding-bottom: 5px;">Total: <span id="totalCnt"></span> 건&nbsp;&nbsp;</span>
				<span style="float: right; padding-bottom: 5px;">
					<span style="color: red;">총액: <span id="payment"></span> 원</span>
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
						<h4 class="modal-title">지출 내역 등록</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="insertForm">
							<div class="form-group">
								<div class="col-sm-2">
									<label>사용 일</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg datepicker" required="required" readonly="readonly" id="iUsedDate">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>적요</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="iSummary" required="required" placeholder="Ex) 저녁 식대, 야근 택시비...">	
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>금액</label>
								</div>
								<div class="col-sm-10">
									<input type="number" class="form-control input-group-lg" id="iPrice" required="required">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-2">
									<label>비고</label>
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
						<h4 class="modal-title">지출 내역 상세 및 수정</h4>
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
									<label>적요</label>
								</div>
								<div class="col-sm-10">
									<input type="text" class="form-control input-group-lg" id="uSummary" placeholder="Ex) 저녁 식대, 야근 택시비...">	
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
									<label>비고</label>
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
					<h4 class="modal-title">결재 올리기</h4>
				</div>
				<div class="modal-body center">
					<canvas id="signCanvas" width="300" height="200" style="border: 1px solid black;"></canvas>
					<br>
					<span>&lt; 내 서명 &gt;</span>
					<br><br><br>
					<div class="form-group">
						<input type="text" id="signTitle" class="form-control" placeholder="결재 제목 (Ex: 12월 지출결의)">
					</div>
					
					<div class="form-group">
						<select class="form-control" id="targetMemberId">
							<option selected="selected" style="display:none;">결재받을 팀장님을 선택하세요.</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="signReqBtn">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;확인
					</button>
				</div>
			</div>
		</div>
	</div><!-- update modal end -->

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
