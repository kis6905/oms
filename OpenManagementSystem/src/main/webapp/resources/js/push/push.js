
/* 
 * Chrome Push
 * 
 * @author iskwon
 */

(function() {
	
	// 웹 푸시
	if ('serviceWorker' in navigator && 'PushManager' in window) {
		
		navigator.serviceWorker.register('/resources/js/push/sw.js')
			.then(function(swReg) {
				
				swReg.pushManager.subscribe({
		            userVisibleOnly: true
		        }).then(function(sub) {
		        	var endpoint = sub.endpoint;
		        	var fcmToken = endpoint.split('gcm/send/')[1];
		        	
		        	console.log('fcmToken: ', fcmToken);
		        	
		        	var callbackSuccess = function(data, textStatus, jqXHR) {
		        		if (data.result == OK) {
		        			console.log('Succeed to register FCM Token');
		        		}
		        		else {
		        			console.log('Failed to register FCM Token');
		        		}
		        	};
		        	callAjax('/main/device/insert', { fcmToken: fcmToken }, callbackSuccess);
		        });
			})
			.catch(function(error) {
				alert(error);
				console.error('Service Worker Error', error);
			});
	}
	else {
		alert('Push messaging is not supported');
		console.warn('Push messaging is not supported');
	}
})();
