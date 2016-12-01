$(document).ready(function() {
	var rememberMe = $.cookie('autoLogin');
	
	if (typeof rememberMe != 'undefined' && rememberMe.length > 0) {
		location.href = '/main';
	}
	
	$('#loginBtn').on('click', function() {
		onClickLoginBtn();
	});
	
	$('#joinBtn').on('click', function() {
		location.href = '/join';
	});
	
	$('#memberId, #password').on('keypress', function() {
		checkEnterKey();
	});
	
});

function onClickLoginBtn() {
	var memberId = $('#memberId').val();
	var password = $('#password').val();
	
	if (memberId == null || memberId.length == 0) {
		alert('ID를 입력하세요.');
		return false;
	}
	
	if (password == null || password.length == 0) {
		alert('비밀번호를 입력하세요.');
		return false;
	}
	
	$('#loginForm').submit();
	
// 	if (validateEmail(memberId)) {
// 		$('#loginForm').submit();
// 	}
// 	else {
// 		alert('Email 형식에 맞지 않습니다.');
// 		$('#memberId').focus();
// 	}
}

/**
 * 엔터 처리
 */
function checkEnterKey(event) {
    var keyupEvent = event || window.event;

    if (keyupEvent.keyCode == 13) {
    	onClickLoginBtn();
    }
}