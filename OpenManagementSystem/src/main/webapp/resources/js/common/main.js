
$(document).ready(function() {
	getServiceList();
});

function getServiceList() {
	var callbackSuccess = function(data, textStatus, jqXHR) {
		if (data.result == OK) {
			var sliderHtml = '';
			var iconHtml = '';
			
			var omsServiceList = data.omsServiceList;
			
			for (var inx = 0; inx < omsServiceList.length; inx++) {
				var omsService = omsServiceList[inx];
				
				sliderHtml += '<li style="background-image: url(\'/resources/images/' + omsService.sliderImage + '\'); background-size: 100%;" onclick="location.href=\'' + omsService.pageUrl + '\'">';
				sliderHtml += '<br><br><span style="font-size: 25px;">' + omsService.title + '</span><br><br>';
				sliderHtml += '<span style="font-size: 15px; margin: 0 5px 0 5px;">' + omsService.description + '</span>';
				sliderHtml += '</li>';
				
				var iconImage = '';
				if (omsService.serviceId == 5) {
					iconImage = omsService.iconImage;
					if (data.receivedApprovalCnt > 0) {
						var imageSplit = omsService.iconImage.split('.');
						iconImage = imageSplit[0] + '_n.' + imageSplit[1];
					}
				}
				else
					iconImage = omsService.iconImage;
				
				iconHtml += '<div id="iconArea" class="col-xs-4 col-sm-3"><span id="iconClickArea" onclick="location.href=\'' + omsService.pageUrl + '\'"><img src="/resources/images/' + iconImage + '" width="50" style="margin-bottom: 10px;"><br>' + omsService.title + '</span></div>';
				
//				iconHtml += '<div id="iconArea" class="col-xs-4 col-sm-3">';
//				iconHtml += '<div class="panel panel-default">';
//				iconHtml += '<div class="panel-body">';
//				iconHtml += '<span id="iconClickArea" onclick="location.href=\'' + omsService.pageUrl + '\'"><img src="/resources/images/' + omsService.iconImage + '" width="50" style="margin-bottom: 10px;"><br>' + omsService.title + '</span></div>';
//				iconHtml += '</div>';
//				iconHtml += '</div>';
			}
			
			$('#sliderServiceItemArea').html(sliderHtml);
			$('#serviceIconRow').html(iconHtml);
			
			createSlider();
		}
		else {
			alert('메뉴를 가져오지 못했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
		}
	};
	callAjax('/service/list', {}, callbackSuccess);
}

function createSlider() {
	var $frame  = $('#sliderServiceArea');
	var $slidee = $frame.children('ul').eq(0);
	var $wrap   = $frame.parent();

	// Call Sly on frame
	$frame.sly({
		horizontal: 1,
		itemNav: 'basic',
		smart: 1,
		activateOn: 'click',
		mouseDragging: 1,
		touchDragging: 1,
		releaseSwing: 1,
		startAt: 0,
		scrollBar: $wrap.find('.scrollbar'),
		scrollBy: 1,
		pagesBar: $wrap.find('.pages'),
		activatePageOn: 'click',
		speed: 1,
		elasticBounds: 1,
		easing: 'easeOutExpo',
		dragHandle: 1,
		dynamicHandle: 1,
		clickBar: 1,
	});
}

