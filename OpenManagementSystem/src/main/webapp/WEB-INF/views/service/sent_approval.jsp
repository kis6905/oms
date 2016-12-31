<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<script type="text/javascript" src="/resources/js/service/sent_approval.js"></script>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		<div class="page-header-custom">
			<span class="page-header-title-custom" style="margin-top: 10px;">올린 결재</span>
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
					<select class="form-control" id="statusCode" style="margin-bottom: 10px;">
						<option value="" selected="selected">전체</option>
						<option value="1201">대기</option>
						<option value="1202">결재</option>
						<option value="1203">철회</option>
						<option value="1204">반려</option>
					</select>
					<button class="btn btn-primary btn-block" type="button" id="inquiryBtn">조회</button>
				</div>
			</div>
			
			<div class="total-info" id="processingBtnArea" style="float: right; padding-bottom: 10px;">
				<button type="button" class="btn btn-danger" id="approvalCancelBtn">
					<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>&nbsp;&nbsp;철회
				</button>
			</div>
			
			<table id="table"></table>
		</div>
		
		<!-- personMoneybookDetailModal modal start -->
		<div id="personMoneybookDetailModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h5 class="modal-title" id="personMoneybookDetailTitle">상세보기</h5>
						<span id="personMoneybookDetailTerm"></span>
					</div>
					<div class="modal-body">
						<div>
							<span id="personMoneybookDetailStatus"></span>
						</div>
						<div class="total-info">
							<span style="float: left; padding-bottom: 5px;">Total: <span id="personMoneybookDetailTotalCnt"></span> 건&nbsp;&nbsp;</span>
							<span style="float: right; padding-bottom: 5px;">
								<span style="color: red;">총액: <span id="personMoneybookDetailPayment"></span> 원</span>
							</span>
						</div>
						<table id="personMoneybookTable"></table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="personMoneybookDetailCloseBtn">
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;확인
						</button>
					</div>
				</div>
			</div>
		</div><!-- personMoneybookDetailModal modal end -->
	</div>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
