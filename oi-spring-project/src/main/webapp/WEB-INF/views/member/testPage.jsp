<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="../template/hm_import.jsp"></c:import>
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
     <div class="body__container">


       <!-- HEADER -->
	<c:import url="../template/header.jsp"></c:import>     

    
     <section class="section mypage">
         <div class="inner">

           
 		<c:import url="../template/mypage-nav.jsp"></c:import>

            <div class="content">
                
                <div class="content-header">
                    <h1 class="page-name">프로필</h1>
                </div>
                
                <div class="content-description">
                    <div class="user-name">
                        <c:if test="${imgName eq null}"><img id="account-image-preview" src="../img/default-user-picture.png"  alt="profile_image"></c:if>
							<c:if test="${imgName ne null}"><img id="account-image-preview" src="../upload/member/${imgName}" alt="profile_image"></c:if>
                        <strong><sec:authentication property="principal.nickName"/></strong>
  
                    </div>
                    <div class="user-info">
                        <div class="star-rating">
                            <span class="colored-star" style="width: ${scoreStar}%;">
                            <!-- style로 별점 조정 -->
                            <!-- score/5*100 =width(%) -->
                            </span>
                        </div>
                        <p>${Score}</p>
                        <p>n명이 평가</p>
                    </div>

                </div>

                <div class="content-body">
                    <div class="title-underline">
                        <p>
                            판매상품 n개
                        </p>
                        <a href="${pageContext.request.contextPath}/mypage/purchase-sell">
                            <i class="bi bi-caret-right-fill"></i>
                        </a>
                    </div>
                    <div class="title-underline">
                        <p>
                            동네생활
                        </p>
                        <a href="${pageContext.request.contextPath}/mypage/village-list">
                            <i class="bi bi-caret-right-fill"></i>
                        </a>
                    </div>
                    <div>
                        <p>
                            받은 리뷰 n
                        </p>
                        <a href="${pageContext.request.contextPath}/mypage/review">
                            <i class="bi bi-caret-right-fill"></i>
                        </a>
                    </div>
                    <!-- 반복문으로 최대 3개만 불러오기 -->
                    <div class="user-review">
                        <div class="user-reivew-detail">
                            <p class="review-name">이름1</p>
                            <p class="review-location">장소1 · 날짜1 </p>
                            <p class="review-contents">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequuntur ullam non aspernatur minus accusantium. Cumque veritatis quibusdam necessitatibus repellat doloribus iure nesciunt eaque, debitis vitae esse cupiditate nobis ipsa incidunt?</p>
                        </div>
                        <div class="user-reivew-detail">
                            <p class="review-name">이름2</p>
                            <p class="review-location">장소2 · 날짜3 </p>
                            <p class="review-contents">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequuntur ullam non aspernatur minus accusantium. Cumque veritatis quibusdam necessitatibus repellat doloribus iure nesciunt eaque, debitis vitae esse cupiditate nobis ipsa incidunt?</p>
                        </div>
                        <div class="user-reivew-detail">
                            <p class="review-name">이름3</p>
                            <p class="review-location">장소2 · 날짜3 </p>
                            <p class="review-contents">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consequuntur ullam non aspernatur minus accusantium. Cumque veritatis quibusdam necessitatibus repellat doloribus iure nesciunt eaque, debitis vitae esse cupiditate nobis ipsa incidunt?</p>
                        </div>


                    </div>

                </div>


            </div>
      
         </div>
     </section>


     
 
        <!-- FOOTER -->
       <c:import url="../template/footer.jsp"></c:import>


     </div>
     <script src="../js/main.js"></script>
     <script src="../js/myPage.js"></script>

</body>
</html>