
var table = null;
var checkedId = false;
var roleList = null;

$(document).ready(function() {
	
	// 권한 목록을 가져온다.
	getRoleList();
	
	// Page 접속 하자마자 회원 목록을 띄운다.
	createTable();
	
	// Event Handlers
	$('#insertOpenBtn').on('click', function() {
		openInsertModal();
	});
	
	$('#insertBtn').on('click', function() {
		insertMember();
	});
	
	$('#updateBtn').on('click', function() {
		updateMember();
	});
	
	$('#deleteBtn').on('click', function() {
		if (confirm('정말 삭제하시겠습니까?'))
			deleteMember();
	});
	
	$('#checkIdBtn').on('click', function() {
		checkId();
	});
	
	$('#iMemberId').on('keyup', function() {
		checkedId = false;
	});

});

/**
 * 권한 목록 가져온다.
 */
function getRoleList() {
	var callbackSuccess = function(data, textStatus, jqXHR) {
		roleList = data.roleList;
		setRoleListHtml(null); // parameter를 null로 보낼경우 등록 form에 그린다.
	};
	callAjax('/admin/member/role/list', {}, callbackSuccess);
}

/**
 * 권한 목록을 등록 form or 수정 form에 그린다.
 * 
 * @param memberRoleList null이면 등록 form, null이 아니면 수정 form에 그린다.
 */
function setRoleListHtml(memberRoleList) {
	if (memberRoleList === null) { // 등록 form
		var html = '';
		for (var inx = 0; inx < roleList.length; inx++) {
			html += '<div class="checkbox">';
			html += '<label>';
			html += '<input type="checkbox" name="iRoles" value="' + roleList[inx].roleId + '">' + roleList[inx].roleName + '';
			html += '</label>';
			html += '</div>';
		}
		$('#iRoleGroup').html(html);
	}
	else { // 수정 form
		var html = '';
		for (var inx = 0; inx < roleList.length; inx++) {
			html += '<div class="checkbox">';
			html += '<label>';
			if (containRole(memberRoleList, roleList[inx]))
				html += '<input type="checkbox" name="uRoles" checked="checked" value="' + roleList[inx].roleId + '">' + roleList[inx].roleName + '';
			else
				html += '<input type="checkbox" name="uRoles" value="' + roleList[inx].roleId + '">' + roleList[inx].roleName + '';
			html += '</label>';
			html += '</div>';
		}
		$('#uRoleGroup').html(html);
	}
}

function containRole(roleList, role) {
	for (var inx = 0; inx < roleList.length; inx++) {
		if (roleList[inx].roleId === role.roleId)
			return true;
	}
	return false;
}



/**
 * ID 중복 체크
 */
function checkId() {
	var memberId = $('#iMemberId').val();
	
	if (memberId === null || memberId === '') {
		alert('ID를 입력하세요!');
		return false;
	}
	
	var data = { memberId: memberId };
	
	var callbackSuccess = function(data, textStatus, jqXHR) {
		if (data.result == OK) {
			checkedId = true;
			alert('사용 가능한 ID 입니다.');
		}
		else {
			checkedId = false;
			$('#id').val('');
			$('#id').focus();
			alert('이미 사용중인 ID 입니다.');
		}
	};
	callAjax('/admin/member/check/id', data, callbackSuccess);
}

/**
 * 등록 
 */
function insertMember() {
	var memberId = $('#iMemberId').val();
	var password = $('#iPassword').val();
	var memberName = $('#iMemberName').val();
	var gradeCode = $('#iGradeCode').val();
	var corpCardLimit = $('#iCorpCardLimit').val();
	var roles = $('input[name=iRoles]:checked').map(function() {
		return $(this).val();
    }).get();
	
	if (memberId === null || password === null || memberName === null || gradeCode === null || corpCardLimit === null ||
			memberId === '' || password === '' || memberName === '' || gradeCode === '' || corpCardLimit === '') {
		alert('입력정보를 확인하세요!');
		return false;
	}
	
	if (password.length < 6) {
		alert('비밀번호는 6자리 이상이여야 합니다.');
		$('#iPassword').focus();
		return false;
	}
	
	if (!checkedId) {
		alert('ID 중복 체크를 해주세요.');
		return false;
	}
	
	var data = {
		memberId: memberId,
		password: password,
		memberName: memberName,
		gradeCode: gradeCode,
		corpCardLimit: corpCardLimit,
		roles: roles
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result == OK) {
				reCreateTable();
				$('#insertModal').modal('hide');
			}
			else {
				alert('등록이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/admin/member/insert', data, callbackSuccess);
}

/**
 * 수정
 */
function updateMember() {
	var memberId = $('#uMemberId').val();
	var password = $('#uPassword').val();
	var memberName = $('#uMemberName').val();
	var gradeCode = $('#uGradeCode').val();
	var corpCardLimit = $('#uCorpCardLimit').val();
	var roles = $('input[name=uRoles]:checked').map(function() {
		return $(this).val();
    }).get();
	
	if (memberId === null || memberName === null || gradeCode === null || corpCardLimit === null ||
			memberId === '' || memberName === '' || gradeCode === '' || corpCardLimit === '') {
		alert('입력정보를 확인하세요!');
		return false;
	}
	
	// 수정 시 비밀번호를 입력안하면 변경하지 않는다.
	if (password !== null && password !== '' && password.length < 6) {
		alert('비밀번호는 6자리 이상이여야 합니다.');
		$('#uPassword').focus();
		return false;
	}
	
	var data = {
		memberId: memberId,
		password: password,
		memberName: memberName,
		gradeCode: gradeCode,
		corpCardLimit: corpCardLimit,
		roles: roles
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result == OK) {
				reCreateTable();
				$('#updateModal').modal('hide');
			}
			else {
				alert('수정이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/admin/member/update', data, callbackSuccess);
}

/**
 * 삭제
 */
function deleteMember() {
	var memberId = $('#uMemberId').val();
	
	if (memberId === null || memberId === '') {
		alert('필요정보가 없습니다. 새로고침 해주세요.');
		return false;
	}
	
	var data = {
		memberId: memberId
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result == OK) {
				reCreateTable();
				$('#updateModal').modal('hide');
			}
			else {
				alert('삭제가 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/admin/member/delete', data, callbackSuccess);
}

/**
 * 등록 버튼 클릭 시 등록 Modal 창 띄우기 
 */
function openInsertModal() {
	checkedId = false;
	
	setRoleListHtml(null);
	$('#iMemberId').val('');
	$('#iMemberName').val('');
	$('#iPassword').val('');
	$('#iGradeCode').val('1002');
	$('#iCorpCardLimit').val('');
	$('#insertModal').modal();
}

/**
 * Table의 Row 클릭 시 수정 Modal 창 띄우기
 */
function openUpdateModal(row) {
	$('#hMemberId').val(row.memberId);
	$('#uMemberId').val(row.memberId);
	$('#uPassword').val('');
	$('#uMemberName').val(row.memberName);
	$('#uGradeCode').val(row.gradeCode);
	$('#uCorpCardLimit').val(row.corpCardLimit);
	$('#uLastLoginDate').val(row.lastLoginDate);
	$('#uRegisteredDate').val(row.registeredDate);
	$('#uModifiedDate').val(row.modifiedDate);
	$('#updateModal').modal();
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
		url: '/admin/member/list',
		contentType: 'application/json',
		dataType: 'json',
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
		sortName: 'registeredDate',
		sortOrder: 'desc',
		onClickRow: function(row, $element) {
			openUpdateModal(row);
			setRoleListHtml(row.roleList);
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
			field: 'memberId',
			title: 'ID',
			width: '30%',
			align: 'center',
			valign: 'middle',
			sortable: true
		}, {
			field: 'memberName',
			title: '이름',
			width: '40%',
			align: 'center',
			valign: 'middle',
			sortable: true
		}, {
			field: 'gradeCode',
			title: '등급',
			width: '25%',
			align: 'center',
			valign: 'middle',
			sortable: true,
			formatter: gradeFormatter
		}]
	});
}

