<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>중고 거래|오이마켓</title>

    <meta name="author" content="wook">
    <meta name="description" content="오이마켓">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, maximum-scale=1">
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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <!-- 먼저 호출되야함 reset! -->
    <link rel="stylesheet" href="../css/mainScss.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" integrity="sha512-IJEbgDEF7OeKJRa0MY2PApnyJHRIsgzCveek4ec8VWQ+7KG3ZSKVNYa5xP/Gh0hVP0Mwb+gBsk+GwR3JQGhQNg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	body{
		background-color:#BDECB6;
	}
</style>

</head>
<body>

   <c:import url="../template/header.jsp"></c:import>
	<div class="chat-select-body">
	
		<div class="">
			<img alt="쪽지보내기" src="../img/chat-insert.png" class="chat-insert-img">
		</div>
		
		<div class="">
			<form action="./chatInsert" method="post" id="frm">
			
				<input type="hidden" id="productNum" name="productNum" value="${param.productNum}">
				<input type="hidden" id="sellerID" name="sellerID" value="${param.sellerID}">
				<input type="hidden" id="buyerID" name="buyerID" value="${param.buyerID}">
				<input type="hidden" id="sellerName" name="sellerName" value="${param.sellerName}">
				<input type="hidden" id="buyerName" name="buyerName" value="${param.buyerName}">
			
				<textarea  id="contents" name="contents" class="chat-insert-contents" name="contents"></textarea>
				<br>
				<input class="mybtn chat-send-button" id="btn" type="image" src="../img/chat-send-button.png" alt="보내기">
				<!-- <button class="mybtn chat-send-button" id="btn" type="submit" ></button> -->
				
			</form>
	
		</div>
		
	</div>
	
	<script>
		
		//1.
		var result = '${msg}';		
	
		//2.
		if(result != ''){
			alert(result);
			window.close();
			//팝업이 열리기 전 페이지(opener)
			window.opener.location.reload();
		}
		
		
	</script>

</body>
</html>