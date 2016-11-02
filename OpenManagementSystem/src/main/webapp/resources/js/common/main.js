$(document).ready(function() {
	getServiceList();
});

function getServiceList() {
	var data = {};
	
	var callbackSuccess = function(data, textStatus, jqXHR) {
		var carouselIndicators = '';
		var carouselInner = '';
		var serviceIconRow = '';
		
		var myServiceList = data.myServiceList;
		
		for (var inx = 0; inx < myServiceList.length; inx++) {
			var myService = myServiceList[inx];
			
			if (inx == 0) {
				carouselIndicators += '<li data-target="#myCarousel" data-slide-to="' + inx + '" class="active"></li>';
				carouselInner += '<div class="item active">';
			}
			else {
				carouselIndicators += '<li data-target="#myCarousel" data-slide-to="' + inx + '"></li>';
				carouselInner += '<div class="item">';
			}
			
			carouselInner += '<img class="slide' + myService.serviceId + '" src="/resources/images/' + myService.sliderImage + '" alt="slide' + myService.serviceId + '">'
							+ '<div class="container">'
								+ '<div class="carousel-caption">'
									+ '<h1>' + myService.title + '</h1>'
									+ '<p>' + myService.description + '</p>'
									+ '<p>&nbsp;</p>'
									+ '<p>&nbsp;</p>'
//									+ '<p>' + myService.description + '</p>'
//									+ '<p><a class="btn btn-primary" href="/service/page/' + myService.serviceId + '" role="button">바로가기</a></p>'
								+ '</div>'
							+ '</div>'
						+ '</div>';
			
			serviceIconRow += '<div id="iconArea" class="col-xs-6 col-sm-3"><span id="iconClickArea" onclick="location.href=\'/service/page/' + myService.serviceId + '\'"><img src="/resources/images/' + myService.iconImage + '" width="50" style="margin-bottom: 10px;"><br>' + myService.title + '</span></div>';
		}
		
		$('#carouselIndicators').html(carouselIndicators);
		$('#carouselInner').html(carouselInner);
		$('#serviceIconRow').html(serviceIconRow);
	};
	
	callAjax('/service/list', data, callbackSuccess);
}

