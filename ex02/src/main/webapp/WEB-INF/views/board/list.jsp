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
	#banner input, #banner select, #banner option{ color:#000000 !important; }
	select{
		width:15%;
		text-align: center;
		padding:0 20px;
		display:inline;
	}
	option{
		background-color:#fff !important;
	}
	#keyword{
		width:55%;
		display:inline;
	}
	#keyword+a{
		border:1px solid white;
	}
	
	th, td{
		text-align: center !important;
		color:#fff !important;
	}
	tbody tr:hover{
		background-color:rgba(255,255,255,0.5) !important;
	}
	.nowPage{
		background-color: #81d4fa !important;
		font-weight: bold;
	}
	.changePage:hover code{
		background-color: #81d4fa !important;
	}
	.regist{
		float:right;
		border-radius:0px;
		border-bottom:1px solid white;
		border-top:1px solid white;
	}
</style>
</head>
<body class="is-preload">
	<c:if test="${boardnum != null}">
		<script>alert("${boardnum}번 게시글 작성 완료!");</script>
	</c:if>
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
				<p>게시판 목록</p>
				<a href="/board/regist${cri.listLink}" class="button primary regist">글 등록</a>
				<div class="table-wrapper" style="clear:both;">
					<table>
						<thead>
							<tr>
								<th style="width:10%;">번호</th>
								<th style="width:40%;">제목</th>
								<th style="width:15%;">작성자</th>
								<th style="width:35%;">작성시간</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${list != null and list.size()>0 }">
									<c:forEach items="${list}" var="board">
										<tr>
											<td>${board.boardnum }</td>
											<td><a href="${board.boardnum}" class="get">${board.boardtitle }</a></td>
											<td>${board.userid }</td>
											<td>${board.regdate }
												<c:if test="${board.regdate != board.updatedate }">
													<br>(${board.updatedate})
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">작성된 게시글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<form id="searchForm" action="/board/list">
					<div>
						<select name="type">
							<option value="" ${pageMaker.cri.type == null ? "selected" : ""}>검색</option>
							<option value="T" ${pageMaker.cri.type == "T" ? "selected" : ""}>제목</option>
							<option value="C" ${pageMaker.cri.type == "C" ? "selected" : ""}>내용</option>
							<option value="W" ${pageMaker.cri.type == "W" ? "selected" : ""}>작성자</option>
							<option value="TC" ${pageMaker.cri.type == "TC" ? "selected" : ""}>제목 또는 내용</option>
							<option value="TW" ${pageMaker.cri.type == "TW" ? "selected" : ""}>제목 또는 작성자</option>
							<option value="TCW" ${pageMaker.cri.type == "TCW" ? "selected" : ""}>제목 또는 내용 또는 작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword }">
						<a href="#" class="button primary">검색</a>
					</div>
				</form>
				<div class="pagination center">
					<c:if test="${pageMaker.prev}">
						<a href="${pageMaker.startPage-1}" class="changePage"><code>&lt;</code></a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="i">
						<c:choose>
							<c:when test="${i == pageMaker.cri.pagenum}">
								<code class="nowPage">${i}</code>
							</c:when>
							<c:otherwise>
								<a href="${i}" class="changePage"><code>${i}</code></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<a href="${pageMaker.endPage+1}" class="changePage"><code>&gt;</code></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<form name="pageForm" id="pageForm" action="/board/list">
		<input type="hidden" value="${pageMaker.cri.pagenum}" name="pagenum">
		<input type="hidden" value="${pageMaker.cri.amount}" name="amount">
		<input type="hidden" value="${pageMaker.cri.type}" name="type">
		<input type="hidden" value="${pageMaker.cri.keyword}" name="keyword">
	</form>
</body>
<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script>
	const pageForm = $("#pageForm");
	const searchForm = $("#searchForm");
	
	$(".get").on("click",function(e){
		e.preventDefault();
		let boardnum = $(this).attr("href");
		pageForm.attr("action","/board/get");
		pageForm.append("<input type='hidden' name='boardnum' value='"+boardnum+"'>");
		pageForm.submit();
	})
	
	$(".changePage").on("click",function(e){
		//e(이벤트)의 기본 동작 막기
		e.preventDefault();
		let pagenum = $(this).attr("href");
		pageForm.find("input[name='pagenum']").val(pagenum);
		pageForm.submit();
	})
	
	$("#searchForm a").on("click",sendit);
	
	function sendit(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색 기준을 선택하세요!");
			return false;
		}
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요!")
			return false;
		}
		searchForm.submit();
	}
	
</script>
</html>









