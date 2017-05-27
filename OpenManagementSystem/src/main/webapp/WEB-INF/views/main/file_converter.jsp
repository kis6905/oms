<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<style type="text/css">
.panel-body.result {
	min-height: 300px;
}
#convertBtn {
	margin-bottom: 20px;
}
#result {
	width: 100%;
	min-height: 300px;
}

</style>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		<div class="page-header-custom">
			<span class="page-header-title-custom" style="margin-top: 10px;">File Converter</span>
		</div>
		<hr class="page-header-hr">
		
		<div id="contents">
				
			<div class="panel panel-default">
				<div class="panel-body">
					<input type="file" class="filestyle" data-buttonName="btn" data-icon="false" data-buttonText="파일 선택" data-size="sm" data-buttonBefore="true" id="file" data-placeholder="변환할 파일을 선택해주세요.">
				</div>
			</div>
			
			<button class="btn btn-primary btn-block" type="button" id="convertBtn">변환</button>
			
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Result</h3>
				</div>
				<div class="panel-body result">
					<textarea id="result"></textarea>
				</div>
			</div>
					
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
	
	$(document).ready(function() {
		$('#convertBtn').on('click', function() {
			var file = document.querySelector('input[type="file"]').files[0];
			console.log(file);
			
			convertToBase64(file);
		});
	});

	function convertToBase64(file) {
		var reader = new FileReader();
		reader.onload = () => {
			var result = reader.result;
			console.log(reader.result);
			result = result.split('base64,')[1];
			$('#result').val(result);
		};
		reader.readAsDataURL(file);
// 		reader.readAsBinaryString(file);
// 		reader.readAsText(file, 'utf-8');
// 		reader.readAsArrayBuffer(file);
	    reader.onerror = (error) => console.log('Error: ', error);
	}
</script>
	
</body>
</html>
