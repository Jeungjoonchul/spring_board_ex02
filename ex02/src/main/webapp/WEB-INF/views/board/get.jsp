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
	.write_area > form > div:nth-of-type(odd) > h4 {
		float:left;
	}
	.write_area > form > div:nth-of-type(odd) > input{
		width:80%;
		float:right;
	}
	form h4{
		line-height:3.25rem;
	}
	hr{ clear:both; }
	.replyForm input, .replyForm textarea{
		width:100%;
	}
	.page{
		text-align: center;
		clear:both;
	}
	.mdf{
	
	}
	
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
				<p>&nbsp;</p>
				<a href="/board/list${cri.listLink}" class="button primary list">목록 보기</a>
				<br>
				<br>
				<br>
				<div class="write_area" style="clear:both;">
					<form name="boardForm" method="post" action="/board/remove">
						<input type="hidden" name="boardnum" value="${board.boardnum }">
						<input type="hidden" value="${cri.pagenum}" name="pagenum">
						<input type="hidden" value="${cri.amount}" name="amount">
						<input type="hidden" value="${cri.type}" name="type">
						<input type="hidden" value="${cri.keyword}" name="keyword">
						<div>
							<h4>제목</h4>
							<input name="boardtitle" type="text" value="${board.boardtitle}" readonly>
						</div>
						<hr>
						<div>
							<h4>내용</h4>
							<textarea name="boardcontents" rows="10" readonly>${board.boardcontents }</textarea>
						</div>
						<hr>
						<div>
							<h4>작성자</h4>
							<input name="userid" type="text" value="${board.userid }" readonly>
						</div>
						<!-- 가지고온 게시글이 현재 세션의 것이라면 띄우기 -->
						<c:if test="${board.userid == loginUser }">
							<hr>
							<div style="text-align: right;">
								<input type="button" value="수정" class="button primary"
								onclick="location.href = '/board/modify${cri.listLink}&boardnum=${board.boardnum}'">
								<input type="submit" value="삭제" class="button primary">
							</div>
						</c:if>
					</form>
					<hr>
					<h3>댓 글</h3>
					<p style="text-align: right;">
						<a href="" class="button primary small regist">댓글 등록</a>
					</p>
					<div class="replyForm row" style="display:none;">
						<div style="width:15%;">
							<h4>작성자</h4>
							<input name="userid" value="${loginUser}" readonly style="text-align: center;">
						</div>
						<div style="width:65%;">
							<h4>내 용</h4>
							<textarea name="replycontents" placeholder="Contents" style="resize:none;"></textarea>
						</div>
						<div style="width:15%;">
							<h4>&nbsp;</h4>
							<a href="#" class="button primary small finish" style="margin-bottom: 1rem;">등록</a>
							<a href="#" class="button primary small cancel">취소</a>
						</div>
					</div>
					<br><br>
					<!-- 댓글 띄우는 ul -->
					<ul class="alt replies"></ul>
					<!-- 댓글 페이징 처리할 div -->
					<div class="page"></div>
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
<script src="/resources/assets/js/reply.js"></script>
<script>
	let boardnum = ${board.boardnum};
	//댓글 띄우는 ul
	const replies = $(".replies");
	//댓글 페이징 처리할 div
	const page = $(".page");
	const loginUser = "${loginUser}";
	//댓글쪽의 현재 페이지 번호
	let pagenum = 1;
	let maxCnt = 0;

	$(document).ready(function(){
		showList(1);
	})

	function showList(pagenum){
		replyService.getList(
			{boardnum:boardnum, pagenum:pagenum||1},
			function(replyCnt, list){
				if(list == null || list.length == 0){
					return;
				}
				let str = "";
				maxCnt = replyCnt;
				
				for(let i=0;i<list.length;i++){
					let reply = list[i];
					//<li style='clear:both' class='li3000'>
					str += "<li style='clear:both;' class='li"+reply.replynum+"'>"
					str += "<div style='display:inline; float:left; width:80%;'>"
					//<strong class='userid3000'>apple</strong>
					str += "<strong class='userid"+reply.replynum+"'>"+reply.userid+"</strong>"
					str += "<p class='reply"+reply.replynum+"'>"+reply.replycontents+"</p></div>"
					str += "<div style='text-align:right;'>"
					str += "<strong>"+reply.regdate+"</strong><br>"
					if(reply.userid == loginUser){
						//<a href='3000' class='modify'>수정</a>
						str += "<a href='"+reply.replynum+"' class='modify'>수정</a>"
						str += "<a href='"+reply.replynum+"' class='mfinish' style='display:none;'>수정완료</a>&nbsp;&nbsp;"
						str += "<a href='"+reply.replynum+"' class='remove'>삭제</a>"
					}
					str += "</div></li>"
				}
				replies.html(str);
				
				$(".modify").on("click",modifyReply);
				$(".mfinish").on("click",modifyReplyOk);
				$(".remove").on("click",deleteReply);
				
				showReplyPage(replyCnt);
			}
		)
		
	}
	function showReplyPage(replyCnt){
		let endPage = Math.ceil(pagenum/5)*5;
		let startPage = endPage - 4;
		
		let prev = startPage != 1;
		let next = false;
		
		if(endPage*5 >= replyCnt){
			endPage = Math.ceil(replyCnt/5);
		}
		if(endPage*5 < replyCnt){
			next = true;
		}
		
		let str = "";
		if(prev){
			//<a class='changePage' href='5'><code>&lt;</code></a>
			str += "<a class='changePage' href='"+(startPage-1)+"'><code>&lt;</code></a>";
		}
		for(let i=startPage;i<=endPage;i++){
			if(i == pagenum){
				str += "<code>"+i+"</code>";
			}
			else{
				str += "<a class='changePage' href='"+i+"'><code>"+i+"</code></a>";
			}
		}
		if(next){
			str += "<a class='changePage' href='"+(endPage+1)+"'><code>&gt;</code></a>";
		}
		page.html(str);
		
		$(".changePage").on("click",function(e){
			e.preventDefault();
			let target = $(this).attr("href");
			pagenum = parseInt(target);
			showList(pagenum);
		})
	}
	
	$(".regist").on("click",function(e){
		e.preventDefault();
		$(".replyForm").show();
		$(this).hide();
	})
	$(".cancel").on("click",function(e){
		e.preventDefault();
		$(".replyForm").hide();
		$(".regist").show();
		$(".replyForm textarea").val("");
	})
	$(".finish").on("click",function(e){
		e.preventDefault();
		let replycontents = $(".replyForm textarea").val();
		
		replyService.add(
			{boardnum:boardnum, userid:loginUser, replycontents:replycontents},
			function(result){
				alert(result+"번 댓글 등록 완료!")
				
				let str = "";
				str += "<li style='clear:both;' class='li"+result+"'>"
				str += "<div style='display:inline; float:left; width:80%;'>"
				str += "<strong class='userid"+result+"'>"+loginUser+"</strong>"
				str += "<p class='reply"+result+"'>"+replycontents+"</p></div>"
				str += "<div style='text-align:right;'>"
				str += "<strong>방금 전</strong><br>"
				str += "<a href='"+result+"' class='modify'>수정</a>"
				str += "<a href='"+result+"' class='mfinish' style='display:none;'>수정완료</a>&nbsp;&nbsp;"
				str += "<a href='"+result+"' class='remove'>삭제</a>"
				str += "</div></li>"
				
				replies.append(str);
				
				$(".modify").on("click",modifyReply);
				$(".mfinish").on("click",modifyReplyOk);
				$(".remove").on("click",deleteReply);
				maxCnt++;
			}
		);
		$(".replyForm textarea").val("");
		$(".replyForm").hide();
		$(".regist").show();
	})
	
	
	function modifyReply(e){
		
	}
	function modifyReplyOk(e){
		
	}
	function deleteReply(e){
		
	}

</script>
</html>









