<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<!-- <link rel="stylesheet" href="/resources/css/sly/sly-main.css"> -->
<link rel="stylesheet" href="/resources/css/egjs-axes/egjs-main.css">

<script type="text/javascript" src="/resources/js/common/main.js"></script>
<script type="text/javascript" src="/resources/js/libs/sly.min.js"></script>
<script type="text/javascript" src="/resources/js/libs/jquery-easing-1.3.js"></script>
<script type="text/javascript" src="/resources/js/libs/axes.pkgd.js"></script>

<!-- TODO ssl 인증서가 유효하지 못해 못가져온다 -->
<!-- <link rel="manifest" href="/resources/js/push/manifest.json"> -->
<!-- <script type="text/javascript" src="/resources/js/push/push.js"></script> -->

<script type="text/javascript">

</script>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		
<!-- 		<div class="panel panel-default" id="sliderServicePanel"> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<div class="frame" id="sliderServiceArea"> -->
<!-- 					<ul class="clearfix" id="sliderServiceItemArea"></ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<div id="carouselWrapper">
	      <div class="list_container">
	        <div id="carousel" style="transform: translateZ(-253px);">
	          <figure class="item" id="" style="transform: rotateY(0deg) translateZ(253px);">
	            <div id="list_cd" style="background-image:url('/resources/images/slider-service-100.png')">
	              <div id="list_cd_hole"></div>
	            </div>
	            <div id="list_cd_title">Too Much</div>
	          </figure>
	          <figure style="transform: rotateY(45deg) translateZ(253px);">
	            <div id="list_cd" style="background-image:url('/resources/images/slider-service-101.png')">
	              <div id="list_cd_hole"></div>
	            </div>
	            <div id="list_cd_title">Woo ah</div>
	          </figure>
	          <figure style="transform: rotateY(90deg) translateZ(253px);">
	            <div id="list_cd" style="background-image:url('/resources/images/slider-service-102.png')">
	              <div id="list_cd_hole"></div>
	            </div>
	            <div id="list_cd_title">Man In The Mirror</div>
	          </figure>
	        </div>
	      </div>
	    </div>
		
		<div id="serviceIconArea">
			<div class="panel panel-success">
<!-- 				<div class="panel-heading"> -->
<!-- 					<h3 class="panel-title">Services</h3> -->
<!-- 				</div> -->
				<div class="panel-body">
					<div class="row" id="serviceIconRow"></div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
