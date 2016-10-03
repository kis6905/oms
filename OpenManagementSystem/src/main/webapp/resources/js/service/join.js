
var validId = false, validNickname = false;
var checkedId, checkNickname;
var canvas, ctx;

$(document).ready(function() {
	
	// 서명 canvas
//	var lastPt = null;
//	canvas = document.getElementById('signCanvas');
//	
//	if (canvas.getContext) {
//		canvas.addEventListener("touchmove", touchDraw, false);
//		canvas.addEventListener("touchend", touchEnd, false);
//		ctx = canvas.getContext('2d');
//
//		function touchDraw(e) {
//			e.preventDefault();
//			$('#tx').html(e.touches[0].pageX);
//			$('#ty').html(e.touches[0].pageY);
//			if (lastPt != null) {
//				ctx.beginPath();
//				ctx.moveTo(lastPt.x, lastPt.y);
//				ctx.lineTo(e.touches[0].pageX, e.touches[0].pageY);
//				ctx.stroke();
//			}
//			lastPt = {x: e.touches[0].pageX, y:e.touches[0].pageY};
//		}
//
//        function touchEnd(e) {
//			e.preventDefault();
//			// Terminate touch path
//			lastPt = null;
//        }
//        
//    	var isDraw = false;
//    	$('#signCanvas').mousemove(function(e) {
//        	if (isDraw) draw(e);        
//		});
//
//    	$('#signCanvas').mousedown(function(e) {
//    		if (e.button === 0) {
//    			isDraw = true;
//    			draw(e);
//    		}
//    	});
//
//    	$('#signCanvas').mouseup(function(e) {
//    		isDraw = false;
//    		lastPt = null;
//    	});
//
//		function draw(e) {
//			if (lastPt != null) {
//				ctx.beginPath();
//				ctx.moveTo(lastPt.x, lastPt.y);
//				ctx.lineTo(e.offsetX, e.offsetY);
//				ctx.stroke();
//			}
//			lastPt = {x: e.offsetX, y:e.offsetY};
//		}
//	}
//	else {
//	    alert('canvas가 지원되지 않는 브라우저입니다. 구글 크롬을 권장합니다.');
//	    return;
//	}
	
});

/**
 * 회원가입
 */
function onClickJoinBtn() {
	var id = $('#id').val();
	var password = $('#password').val();
	var nickname = $('#nickname').val();
	
	var checkId = false;
	var checkPassword = false;
	var checkNickname = false;
	
	if (id != null && id.length > 0) {
		if (validId) {
			if (id == checkedId) {
				checkId = true;
			}
			else {
				alert('ID 체크를 해주세요.');
				$('#id').focus();
				return false;
			}
		}
		else {
			alert('ID 체크를 해주세요.');
			$('#id').focus();
			return false;
		}
	}
	else {
		alert('ID를 입력하세요.');
		$('#id').focus();
		return false;
	}
	
	if (password != null && password.length >= 6) {
		checkPassword = true;
	}
	else {
		alert('비밀번호는 6자리 이상이여야 합니다.');
		$('#password').focus();
		return false;
	}
	
	if (nickname != null && nickname.length > 0) {
		if (validNickname) {
			if (nickname == checkedNickname) {
				checkNickname = true;
			}
			else {
				alert('닉네임 체크를 해주세요.');
				$('#nickname').focus();
				return false;
			}
		}
		else {
			alert('닉네임 체크를 해주세요.');
			$('#nickname').focus();
			return false;
		}
	}
	else {
		alert('닉네임을 입력하세요.');
		$('#nickname').focus();
		return false;
	}
	
	if (checkId && checkPassword && checkNickname)
		$('#joinForm').submit();
}

/**
 * ID 체크
 */
function onClickCheckId() {
	var id = $('#id').val();
	
	if (id != null && id.length > 0) {
		$.ajax({
			url: '/join/check/id',
			method: 'POST',
			dataType: 'json',
			data: {
				id: id
			},
			success: function(data, textStatus, jqXHR) {
				validId = data.result;
				if (data.result) {
					checkedId = id;
					alert('사용 가능한 ID 입니다.');
				}
				else {
					$('#id').val('');
					$('#id').focus();
					alert('이미 사용중인 ID 입니다.');
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('오류가 발생했습니다. 다시 시도해주세요. \n이 문제가 계속될 경우 관리자에게 문의하세요.');
			}
		});
	}
	else {
		alert('ID를 입력하세요.');
		$('#id').focus();
	}
}

/**
 * 닉네임 체크
 */
function onClickCheckNickname() {
	var nickname = $('#nickname').val();
	
	if (nickname != null && nickname.length > 0) {
		$.ajax({
			url: '/join/check/nickname',
			method: 'POST',
			dataType: 'json',
			data: {
				nickname: nickname
			},
			success: function(data, textStatus, jqXHR) {
				validNickname = data.result;
				if (data.result) {
					checkedNickname = nickname;
					alert('사용 가능한 닉네임입니다.');
				}
				else {
					$('#nickname').val('');
					$('#nickname').focus();
					alert('이미 사용중인 닉네임입니다.');
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('오류가 발생했습니다. 다시 시도해주세요. \n이 문제가 계속될 경우 관리자에게 문의하세요.');
			}
		});
	}
	else {
		alert('닉네임을 입력하세요.');
		$('#nickname').focus();
	}
}

function onChangeId() {
	validId = false;
}

function onChangeNickname() {
	validNickname = false;
}