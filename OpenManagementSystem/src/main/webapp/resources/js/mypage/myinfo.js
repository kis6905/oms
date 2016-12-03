
var table = null;
var checkedId = false;
var roleList = null;

$(document).ready(function() {
	
	// Page 접속 하자마자 내 정보를 가져온다.
	getMyInfo();
	
	// Event Handlers
	$('#updateBtn').on('click', function() {
		updateMyInfo();
	});
	
	$('#cancelBtn').on('click', function() {
		location.href = '/main';
	});
});

function getMyInfo() {
	var callbackSuccess = function(data, textStatus, jqXHR) {
		if (data.result === OK) {
			setMyInfoHtml(data.member);
			setRoleListHtml(data.member.roleList);
		}
		else {
			alert("예외가 발생했습니다. 관리자에게 문의하세요.");
		}
	};
	
	callAjax('/mypage/myinfo/detail', {}, callbackSuccess);
}

function setMyInfoHtml(member) {
	$('#uMemberId').val(member.memberId);
	$('#uMemberName').val(member.memberName);
	$('#uCorpCardLimit').val(member.corpCardLimit);
	$('#uGradeCode').val(member.gradeCode == '1001' ? 'Admin' : 'User');
	$('#uLastLoginDate').val(member.lastLoginDate);
	$('#uRegisteredDate').val(member.registeredDate);
	$('#uModifiedDate').val(member.modifiedDate);
}

function setRoleListHtml(roleList) {
	var html = '';
	for (var inx = 0; inx < roleList.length; inx++) {
		html += '<div class="checkbox">';
		html += '<label>';
		html += '<input type="checkbox" name="uRoles" checked="checked" disabled="disabled" value="' + roleList[inx].roleId + '">' + roleList[inx].roleName + '';
		html += '</label>';
		html += '</div>';
	}
	$('#uRoleGroup').html(html);
}

/**
 * 수정
 */
function updateMyInfo() {
	var password = $('#uPassword').val();
	var memberName = $('#uMemberName').val();
	var corpCardLimit = $('#uCorpCardLimit').val();
	
	if (memberName === null || corpCardLimit === null ||
			memberName === '' || corpCardLimit === '') {
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
		password: password,
		memberName: memberName,
		corpCardLimit: corpCardLimit,
	};
	var callbackSuccess = function(data, textStatus, jqXHR) {
		setTimeout(function() {
			$('#loadingDialog').modal('hide');
			if (data.result === OK) {
				alert('수정 되었습니다.');
				location.href = '/main';
			}
			else {
				alert('수정이 실패했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
			}
		}, 800);
	};
	
	$('#loadingDialog').modal();
	callAjax('/mypage/myinfo/update', data, callbackSuccess);
}

