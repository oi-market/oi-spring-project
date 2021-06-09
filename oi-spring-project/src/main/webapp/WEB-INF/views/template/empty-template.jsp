<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오이마켓</title>

    <meta name="author" content="wook">
    <meta name="description" content="oi market">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- 외부에 페이지 공유될때 노출,, 검색엔진에 노출 -->
    <!-- open gragh http://ogp.me/-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="오이마켓">
    <meta property="og:title" content="second hand platform">
    <meta property="og:description" content="중고, 중고거래, 오이마켓">
    <meta property="og:image" content="img/logo-only-oi.com">

    <!--twitter card  -->
    <meta property="twitter:card" content="summary">
    <meta property="twitter:site" content="오이마켓">
    <meta property="twitter:title" content="second hand platform">
    <meta property="twitter:description" content="중고, 중고거래, 오이마켓">
    <meta property="twitter:image" content="img/logo-only-oi">
    <meta property="twitter:url" content="summary">
  
    <link rel="shortcut icon" type="image/x-icon" href="./favicon.ico">
    <link rel="icon" href="./favicon.ico">
    <link rel="apple-touch-icon" href="./favicon.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" integrity="sha512-IJEbgDEF7OeKJRa0MY2PApnyJHRIsgzCveek4ec8VWQ+7KG3ZSKVNYa5xP/Gh0hVP0Mwb+gBsk+GwR3JQGhQNg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- 먼저 호출되야함 reset! -->
    <link rel="stylesheet" href="./css/main.css">
  
</head>
<body>
     <div class="body__container">


      
        <c:import url="./template/header.jsp"></c:import>

    <!-- contents -->
    
     <section class="section">
         <div class="inner">
         
             <!-- <div class="summary">

                <div class="summary__title">
                   <p> 당신 근처의<br>오이마켓</p>
                </div>

                <div class="summary__description">
                    중고 거래부터 동네 정보까지 이웃과 함께해요.<br>
                    가깝고 따뜻한 당신의 근처를 만들어요.
                </div>
            </div>
                <div class="summaryImg">
                </div> -->
      
         </div>
     </section>

     
   

	<c:import url="./template/footer.jsp"></c:import>
      


     </div>
</body>
</html>