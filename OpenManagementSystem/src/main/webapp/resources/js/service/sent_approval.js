
var table, detailPersonMoneybookTable;
var canvas, ctx;

$(document).ready(function() {
	
	// 조회 날짜에 현재 달에 해당하는 시작 일, 종료 일 설정
	setCurrentDate();
	
	// 버튼 Area hide
	$('#processingBtnArea').hide();
	
	$('#inquiryBtn').on('click', function() {
		inquiry();
	});
	
	$('#approvalCancelBtn').on('click', function() {
		processingApproval();
	});
	
	$('#personMoneybookDetailCloseBtn').on('click', function() {
		$('#personMoneybookDetailModal').modal('hide');
	});
});

/**
 * 조회 날짜에 현재 월에 해당하는 시작 일 ~ 종료 일 설정
 */
function setCurrentDate() {
	var endDate = new Date();
	
	var endYear = endDate.getFullYear();
	var endMonth = endDate.getMonth() + 1;
	var endDay = endDate.getDate();
	
	endMonth = endMonth < 10 ? '0' + endMonth : endMonth;
	endDay = endDay < 10 ? '0' + endDay : endDay;
	
	// 시작일은 30일 전이다.
	var startDate = new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate() - 30);
	
	var startYear = startDate.getFullYear();
	var startMonth = startDate.getMonth() + 1;
	var startDay = startDate.getDate();
	
	startMonth = startMonth < 10 ? '0' + startMonth : startMonth;
	startDay = startDay < 10 ? '0' + startDay : startDay;
	
	$('#startDate').val(startYear + '-' + startMonth + '-' + startDay);
	$('#endDate').val(endYear + '-' + endMonth + '-' + endDay);
}

/**
 * 철회하기
 */
function processingApproval() {
	
	var checkedRows = table.bootstrapTable('getAllSelections');
	if (checkedRows.length === 0) {
		alert('처리할 항목을 선택하세요.');
		return false;
	}
	
	var seqs = [];
	for (var inx = 0; inx < checkedRows.length; inx++)
		seqs.push(checkedRows[inx].seq);
	
	console.log(seqs);
	
	var data = {
			seqs: seqs,
			statusCode: '1203'
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			
			if (data.result == OK) {
				alert('처리되었습니다.');
				refreshTable();
			}
			else {
				alert('요청이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/service/sent/approval/processing', data, callbackSuccess);
}

/**
 * Table의 Row 클릭 시 상세 Modal 창 띄우기
 * 결재 종류 추가 시 row.approvalKind 에 따라 띄울 Modal 창 구분
 */
function openDetailModal(row) {
	$('#personMoneybookDetailModal').modal();
	$('#personMoneybookDetailTitle').html(row.title);
	
	var statusHtml = getLabelOfStatusCode(row.statusCode);
	if (row.statusCode != 1201)
		statusHtml += '&nbsp;&nbsp;' + row.completedDate;
	$('#personMoneybookDetailStatus').html(statusHtml);
	
	$('#personMoneybookDetailTerm').html(row.startDate + ' ~ ' + row.endDate);
	
	var data = {
			sentMemberId: row.sentMemberId,
			startDate: row.startDate,
			endDate: row.endDate
	}
	
	if (typeof detailTable === 'undefined' || detailTable === null)
		createPersonMoneybookDetailTable(data);
	else
		reCreatePersonMoneybookDetailTable(data);
}

/**
 * 조회
 */
function inquiry(tableType) {
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	
	if (startDate === null || startDate === '' || endDate === null || endDate === '') {
		alert('시작 일, 종료 일을 입력해주세요.');
		return false;
	}
	
	$('#processingBtnArea').show();
	
	if (typeof table === 'undefined' || table === null)
		createTable();
	else
		refreshTable();
}

/**
 * 테이블 refresh
 */
function refreshTable() {
	if (typeof table !== 'undefined' && table !== null)
		table.bootstrapTable('refresh');
}

/**
 * 테이블 생성
 */
function createTable() {
	// 테이블 생성
	table = $('#table').bootstrapTable({
		ajaxOptions: ajaxOption,
		method: 'post',
		url: '/service/sent/approval/list',
		contentType: 'application/json',
		dataType: 'json',
		queryParams: function(params) {
			location.href = '#';
			params['startDate'] = $('#startDate').val();
			params['endDate'] = $('#endDate').val();
			params['statusCode'] = $('#statusCode').val();
			return params;
		},
		cache: false,
		pagination: true,
		paginationLoop: false,
		sidePagination: 'server',
		pageSize: 15,
		search: false, // search는 별도로 만든다
		showHeader: true,
		showColumns: false,
		showRefresh: false,
		minimumCountColumns: 3,
		clickToSelect: false,
		sortName: 'registeredDate',
		sortOrder: 'desc',
		onClickRow: function(row, $element) {
			openDetailModal(row);
		},
		onLoadError: btOnLoadErrorHandler,
		columns: [{
			field: 'no',
			title: '',
			width: '10%',
			align: 'center',
			valign: 'middle',
			checkbox: true,
			checkboxEnable: false,
			formatter: approvalCheckboxFormatter
		}, {
			field: 'receivedMemberName',
			title: '결재자',
			width: '15%',
			align: 'center',
			valign: 'middle',
			sortable: false
		}, {
			field: 'title',
			title: '결재 제목',
			width: '35%',
			align: 'center',
			valign: 'middle',
			sortable: false,
			formatter: titleFormatter
		}, {
			field: 'statusCode',
			title: '상태',
			width: '10%',
			align: 'center',
			valign: 'middle',
			sortable: false,
			formatter: approvalStatusLabelFormatter
		}, {
			field: 'registeredDate',
			title: '기안 일',
			width: '30%',
			align: 'center',
			valign: 'middle',
			sortable: true,
			formatter: dateFormatter
		}]
	});
}


/**
 * 지출결의 결재 상세보기 테이블 제거 후 생성
 */
function reCreatePersonMoneybookDetailTable(data) {
	if (typeof detailTable != 'undefined' || detailTable != null) {
		detailTable.bootstrapTable('destroy');
		createPersonMoneybookDetailTable(data);
	}
}

/**
 * 지출결의 결재 상세보기 테이블 생성
 */
function createPersonMoneybookDetailTable(data) {
	// 테이블 생성
	detailTable = $('#personMoneybookTable').bootstrapTable({
		ajaxOptions: ajaxOption,
		method: 'post',
		url: '/service/person/moneybook/list',
		contentType: 'application/json',
		dataType: 'json',
		queryParams: function(params) {
			params['startDate'] = data.startDate;
			params['endDate'] = data.endDate;
			return params;
		},
		cache: false,
		pagination: true,
		sidePagination: 'server',
		pageSize: 9999, // 한번에 다보여주기 위해서
		search: false, // search는 별도로 만든다
		showHeader: true,
		showColumns: false,
		showRefresh: false,
		minimumCountColumns: 3,
		clickToSelect: false,
		sortName: 'usedDate',
		sortOrder: 'asc',
		onLoadSuccess: function(data) {
			$('#personMoneybookDetailTotalCnt').html(data.total);
			var totalPrice = data.totalPrice == null ? 0 : data.totalPrice;
			$('#personMoneybookDetailPayment').html(numberFormat(totalPrice));
		},
		onLoadError: btOnLoadErrorHandler,
		columns: [{
			field: 'no',
			title: 'No',
			width: '5%',
			align: 'center',
			valign: 'middle',
			sortable: false
		}, {
			field: 'usedDate',
			title: '사용 일',
			width: '30%',
			align: 'center',
			valign: 'middle',
			sortable: true
		}, {
			field: 'summary',
			title: '적요',
			width: '40%',
			align: 'center',
			valign: 'middle',
			sortable: false
		}, {
			field: 'price',
			title: '금액',
			width: '25%',
			align: 'center',
			valign: 'middle',
			sortable: true,
			formatter: priceFormatter
		}]
	});
}

