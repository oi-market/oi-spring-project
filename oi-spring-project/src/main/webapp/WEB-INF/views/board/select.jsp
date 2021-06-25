<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../template/hm_import.jsp"></c:import>
<meta charset="UTF-8">
<title>${board}글 |오이마켓</title>

<meta name="author" content="wook">
<meta name="description" content="오이마켓">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 외부에 페이지 공유될때 노출,, 검색엔진에 노출 -->
<!-- open gragh http://ogp.me/-->
<meta property="og:type" content="website">
<meta property="og:site_name" content="오이마켓">
<meta property="og:title" content="second hand platform">
<meta property="og:description" content="중고, 중고거래, 오이마켓">
<meta property="og:image" content="img/logo__github.com">

<!--twitter card  -->
<meta property="twitter:card" content="summary">
<meta property="twitter:site" content="오이마켓">
<meta property="twitter:title" content="second hand platform">
<meta property="twitter:description" content="중고, 중고거래, 오이마켓">
<meta property="twitter:image" content="img/logo__github">
<meta property="twitter:url" content="summary">

<link rel="shortcut icon" type="image/x-icon" href="./favicon.ico">
<link rel="icon" href="./favicon.ico">
<link rel="apple-touch-icon" href="./favicon.ico">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap"
	rel="stylesheet">
<!-- 먼저 호출되야함 reset! -->
<link rel="stylesheet" href="../css/mainScss.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css"
	integrity="sha512-IJEbgDEF7OeKJRa0MY2PApnyJHRIsgzCveek4ec8VWQ+7KG3ZSKVNYa5xP/Gh0hVP0Mwb+gBsk+GwR3JQGhQNg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet"
	href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
<!-- jsp로 바꿀때 경로 신경쓰기 -->

</head>
<body>
	<div class="body__container">



		<c:import url="../template/header.jsp"></c:import>




		<section class="section article article--product article--qna">
			<div class="inner">

				<div class="qna--header">
					<h3>제목 : ${vo.title}</h3>

				</div>
				<div class="qna--answer">
					<h3>Contents : ${vo.contents}</h3>
				</div>
					<div style="margin: 50px auto;">
						<a href="./update?num=${vo.num}" 
						class="mybtn mybtn--primary">Update</a> <a
						href="./${board}Delete?num=${vo.num}" 
						class="btn btn-danger"
						onclick="if(!confirm('게시글을 삭제하시겠습니다?')){return false;}">Delete</a>
					</div>
			</div>
		
			





		</section>




		<!-- FOOTER -->
		<c:import url="../template/footer.jsp"></c:import>


	</div>
	<script src="../js/main.js"></script>
	<script src="../js/second-header.js"></script>


</body>
</html>

