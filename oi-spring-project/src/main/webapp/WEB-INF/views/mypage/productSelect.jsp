<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 |오이마켓</title>

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
    <link rel="stylesheet" href="../css/mypage.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <!-- jsp로 바꿀때 경로 신경쓰기 -->

</head>
<body>
       <!-- HEADER -->
       <c:import url="../template/header.jsp"></c:import>  
       
	<!-- 수정 및 삭제 버튼, 상품 이미지, 금액, 업로드 날짜, 판매여부, 판매 지역, 관심 수(보류) -->

	<!-- Product section-->   
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${vo.title}</h1><br>
                        <div class="fs-5 mb-5">
                        <p>${vo.contents}</p>
                        <span>가격: ${vo.price}</span>
                        <br>
                        <br>
                        <span>관심 ${vo.wish}</span> · <span>조회 ${vo.hit}</span> <br><br>
                        <span>지역 ${vo.location}</span> <br><br> <span>날짜 ${vo.regDate}</span>
                        </div>
                        <div class="d-flex">

                        </div>              
                    </div>
                </div>
            </div>
            
                         <c:forEach var="r" items="${review}">
              <%--     <c:forEach var="s" items="${sell}"> --%>
                    <div class="user-review">
                        <div class="user-reivew-detail">
                            <p class="review-name">${r.writer}</p>
                            <p class="review-location">지역1 · ${r.regDate} </p>
                            <p class="review-contents">${r.contents}</p>
                        </div>
                    </div>
                    </c:forEach>
             <%--       </c:forEach> --%>       
 
        <!-- FOOTER -->
       <c:import url="../template/footer.jsp"></c:import>

     <script src="../js/main.js"></script>
     <script src="../js/myPage.js"></script> 
            
        
</body>
</html>