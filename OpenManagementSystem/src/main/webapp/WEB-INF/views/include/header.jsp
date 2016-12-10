<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="text/javascript">

</script>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
<!-- 		<div class="container"> -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/main"><img width="117" height="23" src="/resources/images/logo.png"></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${MEMBER.memberName}<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/mypage/myinfo">내 정보</a></li>
						</ul>
					</li>
					<li role="separator" class="divider"></li>
					<li>
						<a href="/out">로그아웃</a>
					</li>
				</ul>
			</div>
			<!--/.nav-collapse -->
<!-- 		</div> -->
	</nav>
