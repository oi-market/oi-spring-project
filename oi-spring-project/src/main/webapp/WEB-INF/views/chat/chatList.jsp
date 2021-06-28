<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <title>쪽지보관함|오이마켓</title>

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
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../css/chat.css">
    <!-- jsp로 바꿀때 경로 신경쓰기 -->
</head>
<body>

	<div class="body__container body-div">
	
		<!-- HEADER -->
    	<c:import url="../template/header.jsp"></c:import>
		
		<section class="section article section-div">
			<div class="inner">
			
				<div class="buyer-list-div">
				
			                    
			                	
					<c:forEach items="${buyerList}" var="vo" varStatus="i">
					
			            <div class="buyer-div">
   							 						 
			                <a href="./chatList?productNum=${param.productNum}&buyerID=${vo.buyerID}&check=${param.check}&sellerID=${vo.sellerID}">
			                	
			                	<!-- 프로필 이미지 변경부분 !!!! -->
			                	<div>
			                	<c:forEach items="${imgList}" var="imgVo" varStatus="i">
			                	<c:if test="${imgVo eq null}"><img class="buyer-profile" id="account-image-preview" src="../img/default-user-picture.png"  alt="profile_image"></c:if>
									<c:if test="${imgVo ne null}"><img class="buyer-profile" id="account-image-preview" src="../upload/member/${imgVo.fileName}" alt="profile_image"></c:if>	
			                	
			                	</c:forEach>
												                    </div>
			                
			                    <div>
			                    	<c:if test="${param.check == 0}">${vo.buyerName}</c:if>
			                    	<c:if test="${param.check == 1}">${vo.buyerName}</c:if>
			                        <c:if test="${param.check == 2}">${vo.sellerName}</c:if>
			                    </div>
							</a>
						</div>
					</c:forEach>
				</div>
				
				
				<div class="chat-list-div">
					<c:if test="${chatList.size() eq 0}">
						<img alt="send" src="../img/chat-select.png" class="send-img">
					</c:if>
				
				
					<c:forEach items="${chatList}" var="chat" varStatus="i">
			            <div class="margin-down">
			
			                <a href="#" onclick="window.open('./chatSelect?num=${chat.num}','new','scrollbars=yes, resizable=no width=400 height=300, left=400,top=100');return false">
			                    <div>
			                        <c:if test="${chat.senderID == username}">
			                        	<img alt="send" src="../img/chat-receive.png" class="chat-img">
			                        </c:if>
			                        <c:if test="${chat.senderID != username}">
			                        	<img alt="receive" src="../img/chat-send.png" class="chat-img">
			                        </c:if>
			                        ${chat.contents}
			                    </div>
							</a>
							
						</div>
					</c:forEach>
				</div>
			
			</div>
		</section>
		<br><br>
		
		<!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>
	</div>
	<script src="../js/main.js"></script>


</body>
</html>