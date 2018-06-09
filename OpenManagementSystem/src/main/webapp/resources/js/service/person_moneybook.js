
var table;
var canvas, ctx;

$(document).ready(function() {
	
	// 조회 날짜에 현재 달에 해당하는 시작 일, 종료 일 설정
	setCurrentDate();
	
	// 결재권한이 있는 멤버 목록을 가져와 설정
	getApprovalRoleMemberList();
	
	// 조회 정보 hide
	$('#signOpenBtnArea').hide();
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
	
	$('#signOpenBtn').on('click', function() {
		openSignModal();
	});
	
	$('#signReqBtn').on('click', function() {
		requestSign();
	});
	
	$('#iSummarySelect').on('change', function() {
		changeSummary();
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
	
	month = month < 10 ? '0' + month : month;
	day = day < 10 ? '0' + day : day;
	
	$('#startDate').val(year + '-' + month + '-01'); // 시작 일은 3일
	$('#endDate').val(year + '-' + month + '-' + day);
}

/**
 * 결재올리기 버튼 클릭 시 서명 modal 오픈
 */
function openSignModal() {
	$('#signTitle').val('');
	$('#targetMemberId').val('');
	$('#term').val($('#startDate').val() + ' ~ ' + $('#endDate').val());
	
	// 스크롤이 내려가있으면 그림이 정확한 위치에 그려지지 않는다.
	// 때문에 스크롤을 top으로 이동시킨다.
	$('html, body').animate({scrollTop: '0px'}, 300);
	
	// canvas 초기화
	ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.beginPath();
    
    // boostrap-paper theme 적용 후 삼성 폰 기본 웹브라우져에서 canvas에 안 그려지는 버그가 있다.
    // 0.5초 정도 후 모달 창을 띄우면 버그가 발생하지 않는다.
    setTimeout(function() {
		$('#signModal').modal();
    }, 500);
}

/**
 * 결재 권한이 있는 사용자 목록 가져와 설정
 */
function getApprovalRoleMemberList() {
	var callbackSuccess = function(data, textStatus, jqXHR) {
		if (data.result == OK) {
			setApprovalRoleMemberList(data.approvalRoleMemberList);
		}
		else {
			alert('팀장 목록을 가져오는데 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
		}
	};
	callAjax('/service/person/moneybook/signrole/list', {}, callbackSuccess);
}

function setApprovalRoleMemberList(signRoleMemberList) {
	var html = '';
	if (signRoleMemberList.length > 0) {
		html = '<option value="" selected="selected" style="display:none;">결재받을 팀장 or PM 을 선택하세요.</option>';
		for (var inx = 0; inx < signRoleMemberList.length; inx++) {
			var member = signRoleMemberList[inx];
			html += '<option value="' + member.memberId + '">' + member.memberName + '</option>';
		}
	}
	else {
		html = '<option selected="selected" style="display:none;">결재 가능한 회원이 없습니다. 관리자에게 문의하세요.</option>';
	}
	$('#targetMemberId').html(html);
}


/**
 * 등록 
 */
function insertMoneybook() {
	
	var selectedSummary = $('#iSummarySelect').val();
	
	var usedDate = $('#iUsedDate').val();
	var summary = selectedSummary === '0' ? $('#iSummary').val() : selectedSummary;
	var price = $('#iPrice').val();
	var note = $('#iNote').val();
	
	if (usedDate === null || summary === null || price === null ||
			usedDate === '' || summary === '' || price === '') {
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
	
	$('#loadingDialog').modal();
	var receipt = $('#iReceipt')[0].files[0];
	
	var data = {
			usedDate: usedDate,
			summary: summary,
			price: price,
			note: note ? note : ' '
	};
	
	if (receipt) {
		// 영수증 resize
		var img = document.createElement("img");
		var reader = new FileReader();
		reader.onload = function(e) {
			img.src = e.target.result;
			img.onload = function () {
				data['receipt'] = getResizedReceiptData(img);
				insertProcess(data)
	        }
		}
		reader.readAsDataURL(receipt);
	}
	else {
		insertProcess(data)
	}
}

function insertProcess(data) {
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result == OK) {
				refreshTable();
				$('#insertModal').modal('hide');
			}
			else {
				alert('등록이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	callAjax('/service/person/moneybook/insert', data, callbackSuccess);
}

/**
 * 수정
 */
function updateMoneybook() {
	
	var seq = $('#uSeq').val();
	var usedDate = $('#uUsedDate').val();
	var summary = $('#uSummary').val();
	var price = $('#uPrice').val();
	var note = $('#uNote').val();
	
	if (seq === null || usedDate === null || summary === null || price === null ||
			seq === '' || usedDate === '' || summary === '' || price === '') {
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
	
	$('#loadingDialog').modal();
	var receipt = $('#uReceipt')[0].files[0];
	
	var data = {
			seq: seq,
			usedDate: usedDate,
			summary: summary,
			price: price,
			note: note ? note : ' '
	};
	
	if (receipt) {
		// 영수증 resize
		var img = document.createElement("img");
		var reader = new FileReader();
		reader.onload = function(e) {
			img.src = e.target.result;
			img.onload = function () {
				data['receipt'] = getResizedReceiptData(img);
				updateProcess(data);
	        }
		}
		reader.readAsDataURL(receipt);
	}
	else {
		updateProcess(data);
	}
}

function updateProcess(data) {
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result == OK) {
				refreshTable();
				$('#updateModal').modal('hide');
			}
			else {
				alert('수정이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	callAjax('/service/person/moneybook/update', data, callbackSuccess);
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
			if (data.result == OK) {
				refreshTable();
				$('#updateModal').modal('hide');
			}
			else {
				alert('삭제가 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/service/person/moneybook/delete', data, callbackSuccess);
}

/**
 * 등록 버튼 클릭 시 등록 Modal 창 띄우기 
 */
function openInsertModal() {
	$('#iUsedDate').val('');
	$('#iPrice').val('');
	$('#iNote').val('');
	$('#iReceipt').val('');
	$('.file-text').val('');
	$('#insertModal').modal();
	
	$('#iSummary').val('');
	$('#iSummarySelect').val('0');
	$('#iSummary').attr('readonley', false);
}

/**
 * Table의 Row 클릭 시 수정 Modal 창 띄우기
 */
function openUpdateModal(row) {
	$('#uSeq').val(row.seq);
	$('#uUsedDate').val(row.usedDate);
	$('#uSummary').val(row.summary);
	$('#uPrice').val(row.price);
	$('#uNote').val(row.note);
	$('#uReceipt').val('');
	$('.file-text').val('');
	$('#uRegisteredDate').val(row.registeredDate);
	$('#uModifiedDate').val(row.modifiedDate);
	if (row.receiptPath !== null && row.receiptPath !== '')
		$('#uReceiptPath').html('&nbsp;&nbsp;&nbsp;<span style="font-size: 12px; color: blue;" onclick="javascript: window.open(\'' + row.receiptPath + '\', \'_blank\');">&lt;현재 영수증 보기 Click!&gt;</span>');
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
	$('#signOpenBtnArea').show();
	$('#totalInfoArea').show();
	
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
		url: '/service/person/moneybook/list',
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
		onClickRow: function(row, $element) {
			openUpdateModal(row);
		},
		onLoadSuccess: function(data) {
			$('#totalCnt').html(data.total);
			var totalPrice = data.totalPrice == null ? 0 : data.totalPrice;
			$('#payment').html(numberFormat(totalPrice));
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

/**
 * 결재 올리기
 */
function requestSign() {
	
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var requestMemberSign = canvas.toDataURL('image/png');
	var signTitle = $('#signTitle').val();
	var projectName = $('#projectName').val();
	var targetMemberId = $('#targetMemberId').val();
	
	if (startDate === null || startDate === '' || endDate === null || endDate === '') {
		alert('시작 일, 종료 일을 입력해주세요.');
		$('#signModal').modal('hide');
		return false;
	}
	
	if (signTitle === null || signTitle === '') {
		alert('결재 제목을 입력해주세요.');
		return false;
	}
	
	if (projectName === null || projectName === '') {
		alert('프로젝트 명을 입력해주세요.');
		return false;
	}
	
	if (targetMemberId === null || targetMemberId === '') {
		alert('결재받을 팀장님을 선택해주세요.');
		return false;
	}
	
	var data = {
		startDate: startDate,
		endDate: endDate,
		requestMemberSign: requestMemberSign,
		signTitle: signTitle,
		projectName: projectName,
		targetMemberId: targetMemberId // receviedMemberId
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result == OK) {
				alert('결재를 올렸습니다. 결재가 완료되면 자동으로 제출됩니다.');
				$('#signModal').modal('hide');
			}
			else {
				alert('결재올리기가 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/service/person/moneybook/approval/request', data, callbackSuccess);
}

/**
 * 업로드된 이미지를 resize 하여 binary base64 문자열로 리턴한다.
 */
function getResizedReceiptData(img) {
	var receiptCanvas = document.createElement("canvas");
	var receiptCtx = receiptCanvas.getContext("2d");
	receiptCtx.drawImage(img, 0, 0);
	
	// 800x600 정도면 원본 사진의 글씨를 볼 수 있는 정도다.
	var MAX_WIDTH = 800;
	var MAX_HEIGHT = 600;
	var width = img.width;
	var height = img.height;
	
	if (width > height) {
		if (width > MAX_WIDTH) {
			height *= MAX_WIDTH / width;
			width = MAX_WIDTH;
		}
	}
	else {
		if (height > MAX_HEIGHT) {
			width *= MAX_HEIGHT / height;
			height = MAX_HEIGHT;
		}
	}
	receiptCanvas.width = width;
	receiptCanvas.height = height;
	var ctx = receiptCanvas.getContext("2d");
	receiptCtx.drawImage(img, 0, 0, width, height);

	return receiptCanvas.toDataURL("image/png");
}

/**
 * 적요 selectbox 처리
 */
function changeSummary() {
	var selectedSummary = $('#iSummarySelect').val();
	if (selectedSummary === '0') {
		$('#iSummary').val('');
		$('#iSummary').attr('readonly', false);
		$('#iSummary').focus();
	}
	else {
		$('#iSummary').val('');
		$('#iSummary').attr('readonly', true);
	}
}