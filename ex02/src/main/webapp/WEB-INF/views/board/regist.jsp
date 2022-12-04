<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Spring Board</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
	#banner input:not(.button), #banner textarea{
		color:#000000 !important;
		border:1px solid black !important;
	}
	#banner .write_area ::placeholder{
		color:#888 !important;
	}
	.list{
		float:right;
		border-radius:0px;
		border-bottom:1px solid white;
		border-top:1px solid white;
	}
	.write_area{
		width:70%;
		margin:0 auto;
	}
	.write_area input,.write_area textarea{
		margin-bottom: 30px;
	}
	.write_area > form > div:nth-child(odd) > h4 {
		float:left;
	}
	.write_area > form > div:nth-child(odd) > input{
		width:80%;
		float:right;
	}
	form h4{
		line-height:3.25rem;
	}
	hr{ clear:both; }
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header" class="alt">
		<a class="logo" href="/">Spring <span>Board</span></a>
		<nav id="nav">
			<ul>
				<li>${loginUser}님 환영합니다!</li>
				<li class="current"><a href="/">Home</a></li>
				<li><a href="/board/list">Board</a></li>
				<li><a href="/user/logout">Logout</a></li>
			</ul>
		</nav>
	</header>

	<div id="banner">
		<div class="wrapper style1 special">
			<div class="inner">
				<h2 class="heading alt">Board</h2>
				<p>게시판 등록</p>
				<a href="/board/list${cri.listLink}" class="button primary list">목록 보기</a>
				<br>
				<br>
				<br>
				<div class="write_area" style="clear:both;">
					<form name="boardForm" method="post" action="/board/regist">
						<div>
							<h4>제목</h4>
							<input name="boardtitle" type="text" placeholder="Title">
						</div>
						<hr>
						<div>
							<h4>내용</h4>
							<textarea name="boardcontents" placeholder="Contents" rows="10"></textarea>
						</div>
						<hr>
						<div>
							<h4>작성자</h4>
							<input name="userid" type="text" value="${loginUser}" readonly>
						</div>
						<hr>
						<div>
							<input type="submit" value="등록" class="button primary">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
</html>









