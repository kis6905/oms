/*
*
*  Push Notifications codelab
*  Copyright 2015 Google Inc. All rights reserved.
*
*  Licensed under the Apache License, Version 2.0 (the "License");
*  you may not use this file except in compliance with the License.
*  You may obtain a copy of the License at
*
*      https://www.apache.org/licenses/LICENSE-2.0
*
*  Unless required by applicable law or agreed to in writing, software
*  distributed under the License is distributed on an "AS IS" BASIS,
*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*  See the License for the specific language governing permissions and
*  limitations under the License
*
*/

/* eslint-env browser, serviceworker, es6 */

'use strict';

console.log('Started', self);
self.addEventListener('install', function(event) {
	self.skipWaiting();
	console.log('Installed', event);
});
self.addEventListener('activate', function(event) {
	console.log('Activated', event);
});
self.addEventListener('push', function(event) {
	event.waitUntil(
		self.registration.pushManager.getSubscription().then(function(subscription) {
			var fcmToken = subscription.endpoint.split('gcm/send/')[1];
			console.log('fcmToken', fcmToken);
			
			fetch('/main/push/message', {
				method: 'post',
				headers: {
					'Accept': 'application/json',
					'Content-Type': 'application/json'
				},
				body: { fcmToken: fcmToken }
			})
			.then(function(response) { return response.json(); })
			.then(function(data) {
				self.registration.showNotification(data.title, {
					body: data.message
				})
			})
			.catch(function(err) {
				console.log(err);
			});
		})
	);
});
self.addEventListener('notificationclick', function(event) {
	console.log('[Service Worker] Notification click Received.');

	event.notification.close();

	event.waitUntil(
		clients.openWindow('http://localhost:8080/')
	);
});

