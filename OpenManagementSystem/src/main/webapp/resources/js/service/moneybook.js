
var table;
var isCardView = false;

$(document).ready(function() {
	
	// Table Type
	$('.btn-toggle').click(function() {
	    $(this).find('.btn').toggleClass('active');  
	    
	    if ($(this).find('.btn-info').size() > 0) {
	    	var tableTypeBtn = $(this).find('.btn-default')[0];
	    	var tableType = $(tableTypeBtn).val();
	    	$(tableTypeBtn).focusout();
	    	isCardView = tableType === 'list' ? false : true;
	    	$(this).find('.btn').toggleClass('btn-info');
	    	
	    	inquiry();
	    }
	    
	    $(this).find('.btn').toggleClass('btn-default');
	       
	});
	
	// 조회 정보 hide
	$('#excelDownArea').hide();
	$('#totalInfoArea').hide();
	
	$('#inquiryBtn').on('click', function() {
		inquiry();
	});
	
	$('#insertOpenBtn').on('click', function() {
		openInsertModal();
	});
	
	$('#insertBtn').on('click', function() {
		insertMoneybook();
	});
	
	$('#updateBtn').on('click', function() {
		updateMoneybook();
	});
	
	$('#deleteBtn').on('click', function() {
		if (confirm('정말 삭제하시겠습니까?'))
			deleteMoneybook();
	});
	
	$('#excelDownBtn').on('click', function() {
		downloadExcel();
	});
	
});

/* 등록 */
function insertMoneybook() {
	var usedDate = $('#iUsedDate').val();
	var category = $('#iCategory').val();
	var customer = $('#iCustomer').val();
	var usedPlace = $('#iUsedPlace').val();
	var price = $('#iPrice').val();
	var note = $('#iNote').val();
	
	if (usedDate === null || category === null || usedPlace === null || price === null || note === null ||
			usedDate === '' || category === '' || usedPlace === '' || price === '' || note === '') {
		alert('입력정보를 확인하세요!');
		return false;
	}
	
	if (!validateDateFormat(usedDate)) {
		alert('사용일은 날짜 형식에(yyyy-mm-dd) 맞게 입력해야 합니다!');
		$('#iUsedDate').focus();
		return false;
	}
	
	if (!validateNumber(price)) {
		alert('금액은 숫자만 입력해야 합니다!');
		$('#iPrice').focus();
		return false;
	}
	
	var data = {
		usedDate: usedDate,
		category: category,
		customer: customer,
		usedPlace: usedPlace,
		price: price,
		note: note
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result === OK) {
				reCreateTable();
				$('#insertModal').modal('hide');
			}
			else {
				alert('등록이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/service/moneybook/insert', data, callbackSuccess);
}

/* 수정 */
function updateMoneybook() {
	var seq = $('#uSeq').val();
	var usedDate = $('#uUsedDate').val();
	var category = $('#uCategory').val();
	var customer = $('#uCustomer').val();
	var usedPlace = $('#uUsedPlace').val();
	var price = $('#uPrice').val();
	var note = $('#uNote').val();
	
	if (seq === null || usedDate === null || category === null || usedPlace === null || price === null || note === null ||
			seq === '' || usedDate === '' || category === '' || usedPlace === '' || price === '' || note === '') {
		alert('입력정보를 확인하세요!');
		return false;
	}
	
	if (!validateDateFormat(usedDate)) {
		alert('사용일은 날짜 형식에(yyyy-mm-dd) 맞게 입력해야 합니다!');
		$('#uUsedDate').focus();
		return false;
	}
	
	if (!validateNumber(price)) {
		alert('금액은 숫자만 입력해야 합니다!');
		$('#uPrice').focus();
		return false;
	}
	
	var data = {
		seq: seq,
		usedDate: usedDate,
		category: category,
		customer: customer,
		usedPlace: usedPlace,
		price: price,
		note: note
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result === OK) {
				reCreateTable();
				$('#updateModal').modal('hide');
			}
			else {
				alert('수정이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/service/moneybook/update', data, callbackSuccess);
}

/* 삭제 */
function deleteMoneybook() {
	var seq = $('#uSeq').val();
	
	if (seq === null || seq === '') {
		alert('필요정보가 없습니다. 새로고침 해주세요.');
		return false;
	}
	
	var data = {
		seq: seq
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result === OK) {
				reCreateTable();
				$('#updateModal').modal('hide');
			}
			else {
				alert('삭제가 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/service/moneybook/delete', data, callbackSuccess);
}

/* 등록 버튼 클릭 시 등록 Modal 창 띄우기 */
function openInsertModal() {
	$('#iUsedDate').val('');
	$('#iCategory').val('');
	$('#iCustomer').val('');
	$('#iUsedPlace').val('');
	$('#iPrice').val('');
	$('#iNote').val('');
	$('#insertModal').modal();
}

/* Table의 Row 클릭 시 수정 Modal 창 띄우기 */
function openUpdateModal(row) {
	$('#uSeq').val(row.seq);
	$('#uUsedDate').val(row.usedDate);
	$('#uCategory').val(row.category);
	$('#uCustomer').val(row.customer);
	$('#uUsedPlace').val(row.usedPlace);
	$('#uPrice').val(row.price);
	$('#uNote').val(row.note);
	$('#uRegisteredDate').val(row.registeredDate);
	$('#uModifiedDate').val(row.modifiedDate);
	$('#updateModal').modal();
}

/* 조회 */
function inquiry(tableType) {
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	
	if (startDate === null || startDate === '' || endDate === null || endDate === '') {
		alert('시작 일, 종료 일을 입력해주세요.');
		return false;
	}
	
	$('#excelDownArea').show();
	$('#totalInfoArea').show();
	
	if (typeof table === 'undefined' || table === null)
		createTable();
	else
		reCreateTable();
}

/* 테이블 제거 후 생성 */
function reCreateTable() {
	if (typeof table !== 'undefined' || table !== null) {
		table.bootstrapTable('destroy');
		createTable();
	}
}

/* 테이블 생성 */
function createTable() {
	// 테이블 생성
	table = $('#table').bootstrapTable({
		ajaxOptions: ajaxOption,
		method: 'post',
		url: '/service/moneybook/list',
		contentType: 'application/json',
		dataType: 'json',
		queryParams: function(params) {
			location.href = '#';
			params['startDate'] = $('#startDate').val();
			params['endDate'] = $('#endDate').val();
			return params;
		},
		cache: false,
		pagination: true,
		sidePagination: 'server',
//		pageNumber: pageNumber,
		pageSize: 15,
		search: false, // search는 별도로 만든다
		showHeader: true,
		showColumns: false,
		showRefresh: false,
		minimumCountColumns: 3,
		clickToSelect: false,
		sortName: 'usedDate',
		sortOrder: 'desc',
		cardView: isCardView,
		onClickRow: function(row, $element) {
			openUpdateModal(row);
		},
		onLoadSuccess: function(data) {
			$('#totalCnt').html(data.total);
			$('#totalPrice').html(numberFormat(data.totalPrice));
		},
		onLoadError: function(status, res) {
			if (status == 401 || status == 403) {
				alert('Session이 만료되었거나 잘못된 접근입니다.');
				location.href = '/out';
			}
			else {
				alert("예외가 발생했습니다. 관리자에게 문의하세요.");
			}
		},
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
			field: 'usedPlace',
			title: '사용 장소',
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

/* Excel 다운로드 */
function downloadExcel() {
	
	var option = table.bootstrapTable('getOptions');
	var sort = option.sortName;
	var order = option.sortOrder;
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	
	if (startDate === null || startDate === '' || endDate === null || endDate === '') {
		alert('시작 일, 종료 일을 입력해주세요.');
		return false;
	}
	
	var sortInput = $('<input>').attr('type', 'hidden').attr('name', 'sort').val(sort);
	var orderInput = $('<input>').attr('type', 'hidden').attr('name', 'order').val(order);
	var startDateInput = $('<input>').attr('type', 'hidden').attr('name', 'startDate').val(startDate);
	var endDateInput = $('<input>').attr('type', 'hidden').attr('name', 'endDate').val(endDate);
	
	$form = $("<form></form>");
	$form.attr('method', 'post')
		.attr('action', '/service/moneybook/excel')
		.append($(sortInput))
		.append($(orderInput))
		.append($(startDateInput))
		.append($(endDateInput))
		.submit();
}
