<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지|오이마켓</title>

<!-- chat css -->
<link rel="stylesheet" href="../css/chat.css">

<style>
	body{
		background-color:#BDECB6;
	}
</style>
	
</head>
<body>

	<div class="chat-select-body">
	
		<div class="chat-check-img">
			<c:if test="${vo.receiverID eq username}">
				<img alt="receive" src="../img/chat-icon-receive.png" class="chat-send-re-img">
			</c:if>
			<c:if test="${vo.receiverID ne username}">
				<img alt="send" src="../img/chat-icon-send.png" class="chat-send-re-img">
			</c:if>
		</div>
		
		<div class="select-contents">
			${vo.contents}
		</div>
		
		<c:if test="${vo.receiverID eq username}">
			<a href="./chatInsert?productNum=${vo.productNum}&sellerID=${vo.sellerID}&buyerID=${vo.buyerID}
			&sellerName=${vo.sellerName}&buyerName=${vo.buyerName}">
				<img alt="답장" src="../img/chat-button-re.png" class="chat-re-button">
			</a>
		</c:if>
		
	</div>

</body>
</html>