<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/include.jsp" %>

<style type="text/css">
.cartoon-btn {
	margin: 4px 2px 4px 2px;
}

.download-btn {
	cursor: pointer;
}

</style>

</head>

<body>
	<%@ include file="../include/header.jsp" %>

	<!-- Begin page content -->
	<div class="container">
		<div class="page-header-custom">
			<span class="page-header-title-custom" style="margin-top: 10px;">ZANGSISI 만화</span>
		</div>
		<hr class="page-header-hr">
		
		<div id="contents">
			
			<div id="cartoonListArea">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">연재 만화</h3>
					</div>
					<div class="panel-body" id="serialingList">
					</div>
				</div>
				
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">완결 만화</h3>
					</div>
					<div class="panel-body" id="completeList">
					</div>
				</div>
			</div>
			
			<div id="subListArea">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title" id="cartoonTitle"></h3>
					</div>
					<div class="panel-body" id="subList">
					</div>
				</div>
			</div>
			
			<form id="form">
				<input hidden="text" name="pageId" id="pageId">
				<input hidden="text" name="title" id="title">
			</form>
			
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
	
	var currentPageId = '';
	
	$(document).ready(function() {
		$('#cartoonListArea').hide();
		$('#subListArea').hide();
		
		getCartoonList();
		
		$('#cartoonListArea').on('click', function(e) {
			console.log('detail');
			var $target = $(e.target);
			
			if (!$target.is('button'))
				return false;
			
			var pageId = $target.attr('value');
			var title = $target.attr('title');
			$('#cartoonTitle').html(title);
			currentPageId = pageId;
			getSubList(pageId);
			return false;
		});
		
		$('#subList').on('click', function(e) {
			console.log('download');
			var $target = $(e.target);
			if (!$target.is('span'))
				return false;
			
			var pageId = $target.attr('value');
			var title = $target.attr('title');
			download(pageId, title);
			
			return false;
		});
	});
	
	function getCartoonList() {
		
		$('#cartoonListArea').show();
		$('#subListArea').hide();
		
		$.ajax({
			url: '/zangsisi/cartoon/list',
			method: 'POST',
			dataType: 'json',
			success: function(data) {
				if (data.resultCode === 0000) {
					var completeList = data.completeList;
					var serialingList = data.serialingList;
					
					var completeListHtml = '';
					var serialingListHtml = '';
					
					completeList.forEach(function(content) {
						completeListHtml += '<button type="button" class="btn btn-default cartoon-btn" value="' + content.pageId + '" title="' + content.title + '">' + content.title + '</button>';
					});
					
					serialingList.forEach(function(content) {
						serialingListHtml += '<button type="button" class="btn btn-default cartoon-btn" value="' + content.pageId + '" title="' + content.title + '">' + content.title + '</button>';
					});
					
					$('#completeList').html(completeListHtml);
					$('#serialingList').html(serialingListHtml);
					
				}
				else {
					alert("에러가 발생했습니다. 관리자에게 문의하세요.");
				}
			},
			error: function(xhr, stats, errorThrown) {
				console.log(xhr);
				console.log(stats);
				console.log(errorThrown);
				alert("에러가 발생했습니다. 관리자에게 문의하세요.");
			}
		});
	}
	
	function getSubList(pageId) {
		
		$('#cartoonListArea').hide();
		$('#subListArea').show();
		
		$.ajax({
			url: '/zangsisi/sub/list',
			method: 'POST',
			dataType: 'json',
			data: { pageId: pageId },
			success: function(data) {
				if (data.resultCode === 0000) {
					var subList = data.subList;
					var subListHtml = '';
					subList.forEach(function(content) {
						subListHtml += '<h5 value="' + content.pageId + '">' + content.title
									 + '&nbsp;&nbsp;<span class="label label-default download-btn" value="' + content.pageId + '" title="' + content.title + '">Download</span>'
									 + '</h5>';
					});
					$('#subList').html(subListHtml);
				}
				else {
					alert("에러가 발생했습니다. 관리자에게 문의하세요.");
				}
			},
			error: function(xhr, stats, errorThrown) {
				console.log(xhr);
				console.log(stats);
				console.log(errorThrown);
				alert("에러가 발생했습니다. 관리자에게 문의하세요.");
			}
		});
	}
	
	function download(pageId, title) {
		$('#pageId').val(pageId);
		$('#title').val(title);
		
		var form = $('#form')
					.attr('action', '/zangsisi/download')
					.attr('method', 'post')
					.submit();
	}
	
</script>
	
</body>
</html>
