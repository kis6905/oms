
$(document).ready(function() {
	getServiceList();
});

function getServiceList() {
	var data = {};
	
	var callbackSuccess = function(data, textStatus, jqXHR) {
		var sliderHtml = '';
		var iconHtml = '';
		
		var omsServiceList = data.omsServiceList;
		
		for (var inx = 0; inx < omsServiceList.length; inx++) {
			var omsService = omsServiceList[inx];
			
			sliderHtml += '<li style="background-image: url(\'/resources/images/' + omsService.sliderImage + '\'); background-size: 100%;" onclick="location.href=\'' + omsService.pageUrl + '\'">';
			sliderHtml += '<br><br><span style="font-size: 25px;">' + omsService.title + '</span><br><br>';
			sliderHtml += '<span style="font-size: 15px; margin: 0 5px 0 5px;">' + omsService.description + '</span>';
			sliderHtml += '</li>';
			
			iconHtml += '<div id="iconArea" class="col-xs-4 col-sm-3"><span id="iconClickArea" onclick="location.href=\'' + omsService.pageUrl + '\'"><img src="/resources/images/' + omsService.iconImage + '" width="50" style="margin-bottom: 10px;"><br>' + omsService.title + '</span></div>';
			
//			iconHtml += '<div id="iconArea" class="col-xs-4 col-sm-3">';
//			iconHtml += '<div class="panel panel-default">';
//			iconHtml += '<div class="panel-body">';
//			iconHtml += '<span id="iconClickArea" onclick="location.href=\'' + omsService.pageUrl + '\'"><img src="/resources/images/' + omsService.iconImage + '" width="50" style="margin-bottom: 10px;"><br>' + omsService.title + '</span></div>';
//			iconHtml += '</div>';
//			iconHtml += '</div>';
		}
		
		$('#sliderServiceItemArea').html(sliderHtml);
		$('#serviceIconRow').html(iconHtml);
		
		createSlider();
	};
	
	callAjax('/service/list', data, callbackSuccess);
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
		speed: 300,
		elasticBounds: 1,
		easing: 'easeOutExpo',
		dragHandle: 1,
		dynamicHandle: 1,
		clickBar: 1,
	});
}

