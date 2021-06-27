<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
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
    <link rel="stylesheet" href="../css/product.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <!-- jsp로 바꿀때 경로 신경쓰기 -->
  
</head>
<body>
     <div class="body__container">


       <!-- HEADER -->
       <c:import url="../template/header.jsp"></c:import>
       <c:import url="../template/header-product.jsp"></c:import>
       
	

   


    
    <section class="section article article--product">
         <div class="inner">

     
           
				<div class="buttons--modify">
				   <a class="mybtn" href="./update?num=${vo.num}">상품수정</a>
                   <button class="mybtn" id="delBtn">상품 삭제</button>
               </div>
               
               <form action="./delete" id="delfrm" method="post">
					<input type="hidden" name="num" value="${vo.num}">
					<input type="hidden" name="productNum" value="${vo.num}">
				</form>
				
               <form action="./setWish" id="wishFrm" method="post">
					<input type="hidden" name="num" value="${vo.num}">
				</form>
				
				<form action="../chat/chatInsert" method="get" id="chatFrm">
					<input type="hidden" name="productNum" value="${vo.num}">
					<input type="hidden" name="sellerID" value="${vo.members[0].username}">
					<input type="hidden" name="sellerName" value="${vo.members[0].nickName}">
					<input type="hidden" name="buyerID" value=<sec:authentication property="principal.username"/>>
					<input type="hidden" name="buyerName" value=<sec:authentication property="principal.nickName"/>>			
				</form>
	
				
               
                <div class="product-select__body">

 					<div class="body--left">
                        <div class="slide-show">
                        
                        	<c:forEach items="${vo.productFiles}" var="file">
                           <div class="mySlides fades">
                                <img src="../resources/upload/images${file.thumbnail}" alt="상품 이미지">
                               <%--  <p>${vo.productFiles}</p> --%>
                            </div>
                        	</c:forEach>
                        
                            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                            <a class="next" onclick="plusSlides(1)">&#10095;</a>
                        </div>
                        
                        <div style="text-align:center">
                        
                        <c:forEach items="${vo.productFiles}" var="file" varStatus="status">
                        	
                            <span class="dot" onclick="currentSlide(${status.count})" title="${file.productNum}"></span>
                        
                            </c:forEach>
                        </div>
                    </div>


                    <div class="body--right">
                        <strong class="product--name">${vo.title}</strong>
                        <strong class="product--amount">${vo.price}원</strong>
                        <p>${vo.productCategories[0].category}</p>
                        <div class="product-info">
                            <div class="product--like">
                                <i class="bi bi-suit-heart-fill"></i> ${vo.wish}
                            </div>
                            <div class="product--hit">
                                <i class="bi bi-eye-fill"></i> ${vo.hit}
                            </div>
                            <div class="product--date">
                                <i class="bi bi-clock-fill"></i> ${vo.regDate}
                            </div>
                        </div>

                        <a href="">
                            <div class="product--user-info">
                                <div class="user__left">
                                    <div class="user--photo">
                                        <img src="../img/default-user-picture.png">
                                    </div>
                                    <div class="user--namebox">
                                        <div class="user--name">
                                             ${vo.members[0].nickName}
                                        </div>
                                        <div class="user--location">
                                            ${vo.location}
                                        </div>
                                    </div>
                                </div>
                                <div class="user--score">
                                    <div class="star-rating">
                                        <span class="colored-star" style="width: 50%;">
                                        <!-- style로 별점 조정 -->
                                        <!-- score/5*100 =width(%) -->
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <div class="product--description">
                            ${vo.contents}
                                                    </div>


                        <div class="product--buttons">
                            <button class="mybtn zzimBtn" id="wishBtn">
                                <i class="bi bi-suit-heart-fill"></i> 찜 
                            </button>
                            <button class="mybtn chatBtn" id="chatBtn">
                                채팅하기
                            </button>
                        </div>
                    </div>


                </div>







         




        </div>     
     </section>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>


     </div>
     <script src="../js/main.js"></script>
     <script src="../js/second-header.js"></script>
     <script src="../js/product.js"></script>


</body>
</html>

