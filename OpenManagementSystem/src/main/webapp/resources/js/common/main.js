$(document).ready(function() {
	getServiceList();
});

function getServiceList() {
	var data = {};
	
	var callbackSuccess = function(data, textStatus, jqXHR) {
		var carouselIndicators = '';
		var carouselInner = '';
		var serviceIconRow = '';
		
		var omsServiceList = data.omsServiceList;
		
		for (var inx = 0; inx < omsServiceList.length; inx++) {
			var omsService = omsServiceList[inx];
			
			if (inx == 0) {
				carouselIndicators += '<li data-target="#myCarousel" data-slide-to="' + inx + '" class="active"></li>';
				carouselInner += '<div class="item active">';
			}
			else {
				carouselIndicators += '<li data-target="#myCarousel" data-slide-to="' + inx + '"></li>';
				carouselInner += '<div class="item">';
			}
			
			carouselInner += '<img class="slide' + omsService.serviceId + '" src="/resources/images/' + omsService.sliderImage + '" alt="slide' + omsService.serviceId + '">'
							+ '<div class="container">'
								+ '<div class="carousel-caption">'
									+ '<h1>' + omsService.title + '</h1>'
									+ '<p>' + omsService.description + '</p>'
									+ '<p>&nbsp;</p>'
									+ '<p>&nbsp;</p>'
//									+ '<p>' + omsService.description + '</p>'
//									+ '<p><a class="btn btn-primary" href="/service/page/' + omsService.serviceId + '" role="button">바로가기</a></p>'
//									+ '<p><a class="btn btn-primary" href="' + omsService.pageUrl + '" role="button">바로가기</a></p>'
								+ '</div>'
							+ '</div>'
						+ '</div>';
			
//			serviceIconRow += '<div id="iconArea" class="col-xs-6 col-sm-3"><span id="iconClickArea" onclick="location.href=\'/service/page/' + omsService.serviceId + '\'"><img src="/resources/images/' + omsService.iconImage + '" width="50" style="margin-bottom: 10px;"><br>' + omsService.title + '</span></div>';
			serviceIconRow += '<div id="iconArea" class="col-xs-6 col-sm-3"><span id="iconClickArea" onclick="location.href=\'' + omsService.pageUrl + '\'"><img src="/resources/images/' + omsService.iconImage + '" width="50" style="margin-bottom: 10px;"><br>' + omsService.title + '</span></div>';
		}
		
		$('#carouselIndicators').html(carouselIndicators);
		$('#carouselInner').html(carouselInner);
		$('#serviceIconRow').html(serviceIconRow);
	};
	
	callAjax('/service/list', data, callbackSuccess);
}

