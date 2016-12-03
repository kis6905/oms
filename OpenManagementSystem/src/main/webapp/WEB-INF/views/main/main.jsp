<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<link href="/resources/css/sly/sly-custom.css" rel="stylesheet">

<script type="text/javascript" src="/resources/js/common/main.js"></script>
<script type="text/javascript" src="/resources/js/sly.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-easing-1.3.js"></script>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		
		<div class="frame" id="sliderServiceArea">
			<ul class="clearfix" id="sliderServiceItemArea"></ul>
		</div>
		
		<div id="serviceIconArea">
			<div class="row" id="serviceIconRow"></div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
