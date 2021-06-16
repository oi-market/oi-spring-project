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
                    <h1 class="page-name">계정 관리</h1>
                </div>
                
               <div class="account-body">
                    
<sec:authorize access="isAuthenticated()">
 
                        <div class="account__bundle">
                            <div class="account-inner-title">
                                <p>프로필 이미지</p>
                            </div>
                            <img id="account-image-preview" src="../img/default-user-picture.png"  alt="profile_image">
                            <input id="account-image-input" type="file" accept="image/*" onchange="loadImg(event)"> </input>
                            <label for="account-image-input">업로드</label>
                        </div>
                        <div class="account__bundle">
                            <div class="account-inner-title">
                                <p class="red-star">*</p>
                                <label for="account-name">이름</label>
                            </div>
                            <input id="account-name" class="input--text" type="text" name="name" value="<sec:authentication property="principal.name"/>"> </input>
                        </div>

                        <div class="account__bundle">
                            <div class="account-inner-title">
                                <p class="red-star">*</p>
                                <label for="account-nickname">닉네임</label>
                            </div>
                            <input id="account-nickname" class="input--text" type="text" name="nickName" value="<sec:authentication property="principal.nickName"/>"> </input>
                        </div>

                        <div class="account__bundle">
                            <div class="account-inner-title">
                                <p class="red-star">*</p>
                                <label for="account-email">이메일</label>
                            </div>
                            <input id="account-email" class="input--text" type="text" name="email" value="<sec:authentication property="principal.email"/>"> </input>
                        </div>
                        <div class="account__bundle">
                            <div class="account-inner-title">
                                <p class="red-star">*</p>
                                <label for="account-phone">휴대전화</label>
                            </div>
                            <input id="account-phone" class="input--text" type="text" name="phone" value="<sec:authentication property="principal.phone"/>"> </input>
                        </div>

                    

                   
                   
                        <input class="mybtn passwordBtn" type="button" onclick="update_dtn()" value="바꾸기"></input>

                  </sec:authorize>  
                    
                </div>
                
        
                


            </div>
            
         </div>
     </section>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>

     </div>
     <script src="../js/main.js"></script>
     <script src="../js/myPage.js"></script>'
     <script type="text/javascript"></script>
	<script type="text/javascript" src="../js/member.js"></script>

</body>
</html>