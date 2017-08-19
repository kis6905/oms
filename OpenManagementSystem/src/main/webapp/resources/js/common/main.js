
$(document).ready(function() {
  getServiceList();
});

function getServiceList() {
	
	var callbackSuccess = function(data, textStatus, jqXHR) {
		if (data.result == OK) {
			var sliderHtml = '';
			var iconHtml = '';
			var rotateY = 0;
			
			var omsServiceList = data.omsServiceList;
			var length = omsServiceList.length;
			var rotateYIncrease = 360 / length;
			
			for (var inx = 0; inx < omsServiceList.length; inx++) {
				var omsService = omsServiceList[inx];
				
				sliderHtml += `<figure onclick="location.href='${omsService.pageUrl}'" style="transform: rotateY(${rotateY}deg) translateZ(253px);">
					             <div id="list_cd" style="background-image:url('/resources/images/${omsService.sliderImage}')">
					               <div id="list_cd_hole"></div>
					             </div>
					             <div id="list_cd_title">${omsService.title}</div>
					           </figure>`;
				
				rotateY += rotateYIncrease;
				
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
				
				iconHtml += '<div id="iconArea" class="col-xs-4 col-sm-3"><span id="iconClickArea" onclick="location.href=\'' + omsService.pageUrl + '\'"><img src="/resources/images/' + iconImage + '" width="50" style="margin-bottom: 5px;"><br>' + omsService.title + '</span></div>';
			}
			
			$('#carousel').html(sliderHtml);
			$('#serviceIconRow').html(iconHtml);
			
			create3DView(length);
		}
		else {
			alert('메뉴를 가져오지 못했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
		}
	};
	
	/*
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
			}
			
			$('#sliderServiceItemArea').html(sliderHtml);
			$('#serviceIconRow').html(iconHtml);
			
			createSlider();
		}
		else {
			alert('메뉴를 가져오지 못했습니다. 관리자에게 문의해주세요. (error code: ' + data.result + ')');
		}
	};
	*/
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

function create3DView(length) {
  const carousel = document.getElementById("carousel");
  const ANGLE = 360 / length; 

  const axes = new eg.Axes({
    rotate: {
      range: [0, 360],
      circular: true
    }
  });

  axes.on({
    'change': ({ pos }) => {
      carousel.style[eg.Axes.TRANSFORM] = 'translateZ(-253px) rotateY(' + pos.rotate + 'deg)';
      console.log('change');
    },
    'release': ({ destPos, setTo }) => {
      setTo({ 'rotate': Math.round(destPos.rotate / ANGLE) * ANGLE } , 800);
      console.log('release');
    },
  });

  axes.connect('rotate', new eg.Axes.PanInput('#carouselWrapper'));
}

