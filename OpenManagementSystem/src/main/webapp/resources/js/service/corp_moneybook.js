
var table;
var canvas, ctx;

$(document).ready(function() {
	
	// 조회 날짜에 현재 달에 해당하는 시작 일, 종료 일 설정
	setCurrentDate();
	
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
	
	$('#excelDownOpenBtn').on('click', function() {
		openSignModal();
	});
	
	$('#excelDownBtn').on('click', function() {
		downloadExcel();
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
	var date = new Date();
	
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	
	var startMonth = month < 10 ? '0' + month : month;
	if (day < 3)
		startMonth = (month - 1) < 10 ? '0' + (month - 1) : (month - 1);
	var endMonth = month < 10 ? '0' + month : month;
	
	day = day < 10 ? '0' + day : day;
	
	$('#startDate').val(year + '-' + startMonth + '-03'); // 시작 일은 3일
	
	$('#endDate').val(year + '-' + endMonth + '-' + day);
}

/**
 * Excel Download 버튼 클릭 시 서명 modal 오픈
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
 * 등록 
 */
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
	callAjax('/service/corp/moneybook/insert', data, callbackSuccess);
}

/**
 * 수정
 */
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
	callAjax('/service/corp/moneybook/update', data, callbackSuccess);
}

/**
 * 삭제
 */
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
	callAjax('/service/corp/moneybook/delete', data, callbackSuccess);
}

/**
 * 등록 버튼 클릭 시 등록 Modal 창 띄우기 
 */
function openInsertModal() {
	$('#iUsedDate').val('');
	$('#iCategory').val('');
	$('#iCustomer').val('');
	$('#iUsedPlace').val('');
	$('#iPrice').val('');
	$('#iNote').val('');
	$('#insertModal').modal();
}

/**
 * Table의 Row 클릭 시 수정 Modal 창 띄우기
 */
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
	
	$('#defaultArea').hide();
	$('#excelDownArea').show();
	$('#totalInfoArea').show();
	
	if (typeof table == 'undefined' || table == null)
		createTable();
	else
		reCreateTable();
}

/**
 * 테이블 제거 후 생성
 */
function reCreateTable() {
	if (typeof table != 'undefined' || table != null) {
		table.bootstrapTable('destroy');
		createTable();
	}
}

/**
 * 테이블 생성
 */
function createTable() {
	// 테이블 생성
	table = $('#table').bootstrapTable({
		ajaxOptions: ajaxOption,
		method: 'post',
		url: '/service/corp/moneybook/list',
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
		paginationLoop: false,
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
		onClickRow: function(row, $element) {
			openUpdateModal(row);
		},
		onLoadSuccess: function(data) {
			$('#totalCnt').html(data.total);
			var totalPrice = data.totalPrice == null ? 0 : data.totalPrice;
			$('#payment').html(numberFormat(totalPrice));
			$('#balance').html(numberFormat(data.corpCardLimit - totalPrice)); // 자신의 한도 - 총 결제액
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

/**
 * Excel 다운로드
 */
function downloadExcel() {
	
	$('#signModal').modal('hide');
	
	var option = table.bootstrapTable('getOptions');
	var sort = option.sortName;
	var order = option.sortOrder;
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var signImage = canvas.toDataURL('image/png');
	
	if (startDate === null || startDate === '' || endDate === null || endDate === '') {
		alert('시작 일, 종료 일을 입력해주세요.');
		return false;
	}
	
	var sortInput = $('<input>').attr('type', 'hidden').attr('name', 'sort').val(sort);
	var orderInput = $('<input>').attr('type', 'hidden').attr('name', 'order').val(order);
	var startDateInput = $('<input>').attr('type', 'hidden').attr('name', 'startDate').val(startDate);
	var endDateInput = $('<input>').attr('type', 'hidden').attr('name', 'endDate').val(endDate);
	var signInput = $('<input>').attr('type', 'hidden').attr('name', 'sign').val(signImage);
	
	$form = $("<form></form>");
	$form.attr('method', 'post')
		.attr('action', '/service/corp/moneybook/excel')
		.append($(sortInput))
		.append($(orderInput))
		.append($(startDateInput))
		.append($(endDateInput))
		.append($(signInput))
		.submit();
}
