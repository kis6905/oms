
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
	
	$('#approvalCompletionBtn').on('click', function() { // 결재 버튼
		openSignModal();
	});
	
	$('#approvalCompletionReqBtn').on('click', function() { // 서명 Modal 창에서 확인 버튼
		processingApproval(true);
	});
	
	$('#approvalReturnBtn').on('click', function() { // 반려 버튼
		processingApproval(false);
	});
	
	$('#personMoneybookDetailCloseBtn').on('click', function() {
		$('#personMoneybookDetailModal').modal('hide');
	});

	// 서명 canvas
    var lastPt = null;
	canvas = document.getElementById('signCanvas');
	
	if (canvas.getContext) {
		canvas.addEventListener("touchmove", touchDraw, false);
		canvas.addEventListener("touchend", touchEnd, false);
		ctx = canvas.getContext('2d');

		function touchDraw(e) {
			e.preventDefault();
			var rect = canvas.getBoundingClientRect();
			if (lastPt != null) {
				ctx.beginPath();
				ctx.moveTo(lastPt.x, lastPt.y);
				ctx.lineTo(e.touches[0].pageX - rect.left, e.touches[0].pageY - rect.top);
				ctx.stroke();
			}
			lastPt = { x: e.touches[0].pageX - rect.left, y:e.touches[0].pageY - rect.top };
		}

        function touchEnd(e) {
			e.preventDefault();
			// Terminate touch path
			lastPt = null;
        }
        
    	var isDraw = false;
    	$('#signCanvas').mousemove(function(e) {
        	if (isDraw) draw(e);        
		});

    	$('#signCanvas').mousedown(function(e) {
    		if (e.button === 0) {
    			isDraw = true;
    			draw(e);
    		}
    	});

    	$('#signCanvas').mouseup(function(e) {
    		isDraw = false;
    		lastPt = null;
    	});

		function draw(e) {
			if (lastPt != null) {
				ctx.beginPath();
				ctx.moveTo(lastPt.x, lastPt.y);
				ctx.lineTo(e.offsetX, e.offsetY);
				ctx.stroke();
			}
			lastPt = {x: e.offsetX, y:e.offsetY};
		}
	}
	else {
	    alert('canvas가 지원되지 않는 브라우저입니다. 구글 크롬을 권장합니다.');
	    return;
	}
	
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
 * 결재 버튼 클릭 시 서명 modal 오픈
 */
function openSignModal() {
	// 스크롤이 내려가있으면 그림이 정확한 위치에 그려지지 않는다.
	// 때문에 스크롤을 top으로 이동시킨다.
	$('html, body').animate({scrollTop: '0px'}, 300);
	
	// canvas 초기화
	ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.beginPath();
    
    // boostrap-paper theme 적용 후 삼성 폰 기본 웹브라우져에서 canvas에 안그려지는 버그가 있다.
    // 0.5초 정도 후 모달 창을 띄우면 버그가 발생하지 않는다.
    setTimeout(function() {
    	$('#signModal').modal();
    }, 500);
}

/**
 * 결재하기 or 반력하기
 */
function processingApproval(isApproval) {
	
	var checkedRows = table.bootstrapTable('getAllSelections');
	if (checkedRows.length === 0) {
		alert('처리할 항목을 선택하세요.');
		return false;
	}
	
	var seqs = [];
	for (var inx = 0; inx < checkedRows.length; inx++)
		seqs.push(checkedRows[inx].seq);
	
	var statusCode = isApproval ? '1202' : '1204';
	var receivedMemberSign = canvas.toDataURL('image/png');
	
	var data = {
			seqs: seqs,
			statusCode: statusCode,
			receivedMemberSign: receivedMemberSign
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			
			if (data.result == OK) {
				if (isApproval)
					alert('처리되었습니다. 결재 내용은 자동으로 제출됩니다.');
				else
					alert('처리되었습니다.');
				
				$('#signModal').modal('hide');
				refreshTable();
			}
			else {
				alert('요청이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/service/received/approval/processing', data, callbackSuccess);
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
		url: '/service/received/approval/list',
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
			field: 'sentMemberName',
			title: '기안자',
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
			sortable: true,
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
	if (typeof detailTable !== 'undefined' || detailTable !== null) {
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
			params['sentMemberId'] = data.sentMemberId;
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
