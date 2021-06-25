<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지보내기|오이마켓</title>

<!-- chat css -->
<link rel="stylesheet" href="../css/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	body{
		background-color:#BDECB6;
	}
</style>

</head>
<body>

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