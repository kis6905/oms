<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<script type="text/javascript">

</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<div class="container">
		<div class="panel panel-danger" style="margin-top: 10px;">
			<div class="panel-heading">
				<h3 class="panel-title">Error...</h3>
			</div>
			<div class="panel-body">
				잘못된 요청이거나 현재 준비 중인 서비스입니다.
			</div>
		</div>
		<p class="text-center">
			<button type="button" class="btn btn-default" onclick="javascript: location.href='/main'">
				<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			</button>
		</p>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
