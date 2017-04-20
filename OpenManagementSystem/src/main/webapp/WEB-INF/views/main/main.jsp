<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<link rel="stylesheet" href="/resources/css/sly/sly-main.css">

<script type="text/javascript" src="/resources/js/common/main.js"></script>
<script type="text/javascript" src="/resources/js/libs/sly.min.js"></script>
<script type="text/javascript" src="/resources/js/libs/jquery-easing-1.3.js"></script>

<!-- TODO ssl 인증서가 유효하지 못해 못가져온다 -->
<!-- <link rel="manifest" href="/resources/js/push/manifest.json"> -->
<!-- <script type="text/javascript" src="/resources/js/push/push.js"></script> -->

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		
		<div class="panel panel-default" id="sliderServicePanel">
			<div class="panel-body">
				<div class="frame" id="sliderServiceArea">
					<ul class="clearfix" id="sliderServiceItemArea"></ul>
				</div>
			</div>
		</div>
		
<!-- 		<div id="serviceIconArea"> -->
<!-- 			<div class="row" id="serviceIconRow"></div> -->
<!-- 		</div> -->
		
		<div id="serviceIconArea">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Services</h3>
				</div>
				<div class="panel-body">
					<div class="row" id="serviceIconRow"></div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
