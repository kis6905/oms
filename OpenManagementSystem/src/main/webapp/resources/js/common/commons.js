/**
 * Commons JS.
 * 
 * @author iskwon
 */
var annotationDivision; // 주석을 구분하기 위함, 변수 자체는 의미없음

/****************************************************
 * 기본 설정
 ****************************************************/
var ajaxOption = {
		beforeSend: function(xhr) {
	        xhr.setRequestHeader("AJAX", true);
		}
	};

$(document).ready(function() {

	// navbar가 열린 후 스크롤 움직일 시 닫기
    $(window).scroll(function (event) {
        var expanded = $('.navbar-collapse').attr('aria-expanded');
        if (expanded === 'true')
        	$('.navbar-collapse').collapse('hide');
    });
	
	// navbar가 열린 후 다른 곳 클릭 시 닫기
	$('.container').click(function(event) {
		$('.navbar-collapse').collapse('hide');
	});
	
	// button 클릭 후 포커스 해제
	$('.btn').mouseup(function() { this.blur() });
	
	// jquery datepicker 옵션
	$('.datepicker').datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd',
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	// ajax session check를 위함
	$.ajaxSetup(ajaxOption);
	
});


/****************************************************
 * 상수
 ****************************************************/
// 공통
var OK		= 0;
var NOT_OK	= 1;
var COMMON_SERVER_ERROR	= 9999; // 서버 에러

// 로그인 관련 상수
var LOGIN_SUCCESS					= 101; // 성공
var LOGIN_FAIL_MISMATCH				= 102; // 계정 or 비밀번호 불일치
var LOGIN_FAIL_DISABLED				= 103; // 계정 비활성화
var LOGIN_FAIL_ACCOUNT_EXPIRED		= 104; // 계정 만료
var LOGIN_FAIL_CREDENTIALS_EXPIRED	= 105; // 계정 권한 만료
var LOGIN_FAIL_LOCKED				= 106; // 계정 잠김


/****************************************************
 * 입력 형식 체크
 ****************************************************/
var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
var numberRegex = /^[0-9]*$/;
var dateRegex = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;

function validateEmail(email) {
    return emailRegex.test(email);
}

function validateNumber(input) {
	return numberRegex.test(input);
}

function validateDateFormat(input) {
    return dateRegex.test(input);
}


/****************************************************
 * 유틸리티
 ****************************************************/
// 현재 날짜에서 입력받은 날짜를 빼서 나온 일 수를 리턴한다.
function diffFromSysdate(inputDate) {
	var sysdate = new Date();
	return Math.floor((sysdate.getTime() - inputDate.getTime()) / 1000 / 60 / 60 / 24);
}

// 입력된 숫자에 ,를 찍은 형태로 돌려준다.
function numberFormat(input) {
    var input = String(input);
    var reg = /(\-?\d+)(\d{3})($|\.\d+)/;
    if(reg.test(input)){
        return input.replace(reg, function(str, p1, p2, p3) {
                return numberFormat(p1) + "," + p2 + "" + p3;
            }    
        );
    }
    else {
        return input;
    }
}


/****************************************************
 * bootstrap-table에서 사용될 각종 포매터
 ****************************************************/
// 금액 포매터
var priceFormatter = function(value, row, index) {
	return numberFormat(row.price);
}

// 닉네임 포매터
var nicknameFormatter = function(value, row, index) {
	if (row.nickname.length > 3)
		return row.nickname.substring(0, 3) + '..';
	else
		return row.nickname;
}

// 제목 포매터
var boardTitleFormatter = function(value, row, index) {
	var result;
	if (row.title.length > 15)
		result = row.title.substring(0, 16) + '...';
	else 
		result = row.title;
	
	result += '&nbsp; <span class="comment">[' + row.commentCount + ']</span>';
	
	var arr = row.registeredDate.substring(0, 10).split("-");
	var date = new Date(arr[0], arr[1] - 1, arr[2]); // 년, 월, 일
	if (diffFromSysdate(date) == 0)
		result += '&nbsp;&nbsp;<span class=\"label label-danger\">N</span>';
	
	return result;
}

// 날짜 포매터
var dateFormatter = function(value, row, index) {
	return value.substring(0, 10);
}

// 게시판에서의 등록 일 포매터(오늘이면 시간/분, 오늘이 지난 경우 월/일)
var registeredDateFormatter = function(value, row, index) {
	var arr = row.registeredDate.substring(0, 10).split("-");
	var date = new Date(arr[0], arr[1] - 1, arr[2]); // 년, 월, 일
	
	if (diffFromSysdate(date) > 0)
		return row.registeredDate.substring(5, 10);
	else
		return row.registeredDate.substring(11, 16);
}

// 등급 포매터
var gradeFormatter = function(value, row, index) {
	switch (row.gradeCode) {
		case 1001:
			return 'Admin';
		case 1002:
		default:
			return 'User';
	}
}


/****************************************************
 * 공통으로 사용되는 Ajax 호출 function
 ****************************************************/
function callAjax(url, data, success) {
	$.ajax({
		url: url,
		method: 'post',
		dataType: 'json',
		data: data,
		success: success,
		error: function(xhr, stats, errorThrown) {
			$('#loadingDialog').modal('hide');
			if (xhr.status === 401 || xhr.status === 403) {
				alert('Session이 만료되었거나 잘못된 접근입니다.');
				location.href = '/out';
			}
			else {
				alert("예외가 발생했습니다. 관리자에게 문의하세요.");
			}
		}
	});
}
