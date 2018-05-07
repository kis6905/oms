<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<script type="text/javascript" src="/resources/js/admin/corp_approval.js"></script>

</head>
<%-- zzzzzz --%>
<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		<div class="page-header-custom">
			<span class="page-header-title-custom" style="margin-top: 10px;">법카 결재</span>
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
			
<!-- 			<div class="total-info" id="processingBtnArea" style="float: right; padding-bottom: 10px;"> -->
<!-- 				<span style="float: left; padding-bottom: 5px;">Total: <span id="totalCnt"></span> 건</span> -->
<!-- 			</div> -->
			
			<table id="table"></table>
		</div>
		
		<!-- corpMoneybookDetailModal modal start -->
		<div id="corpMoneybookDetailModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h5 class="modal-title" id="corpMoneybookDetailTitle">상세보기</h5>
						<span id="corpMoneybookDetailTerm"></span>
					</div>
					<div class="modal-body">
						<span id="corpMoneybookDetailStatus"></span>
						<br><br>
						<div id="excelDownArea">
							<button class="btn btn-success btn-block" type="button" id="excelDownBtn">
								<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>&nbsp;&nbsp;Excel Download
							</button>
						</div>
						<div class="total-info">
							<span style="float: left; padding-bottom: 5px;">Total: <span id="corpMoneybookDetailTotalCnt"></span> 건&nbsp;&nbsp;</span>
							<span style="float: right; padding-bottom: 5px;">
								<span style="color: red;">총액: <span id="corpMoneybookDetailPayment"></span> 원</span>
							</span>
						</div>
						<table id="corpMoneybookTable"></table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="corpMoneybookDetailCloseBtn">
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;확인
						</button>
					</div>
				</div>
			</div>
		</div><!-- corpMoneybookDetailModal modal end -->
	</div>
	
	<div id="excelDwonForm"></div>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
