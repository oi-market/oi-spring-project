<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
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
     <div class="body__container">


       <!-- HEADER -->
 <c:import url="../template/header.jsp"></c:import>  
    
     <section class="section mypage">
         <div class="inner">
 		<c:import url="../template/viewpage-nav.jsp"></c:import>
           

            <div class="content">
                
                <div class="content-header">
                    <h1 class="page-name">내 동네 설정</h1>
                </div>
                
               <div class="content-description">
                    

                <div class="content-body">
                    <div class="title-underline">
                        <p>
                            지금 내 동네
                        </p>
                    </div>
                    <div class="on-sale">

                       
                        <div>
                            (멤버에서 받아오는 동네)
                            <!--${member.location}-->
                        </div>
                       
                  
                    </div>
                    <div class="title-underline">
                        <p>
                            동네 변경
                        </p>
                    </div>
                    <!-- 반복문으로 최대 3개만 불러오기 -->
                    <div class="on-sale">

                        <!-- 1안 주소api 사용,,
                        <input type="text" id="sample3_postcode" placeholder="우편번호">
                        <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
                        <input type="text" id="sample3_address" placeholder="주소"><br>
                        <input type="text" id="sample3_detailAddress" placeholder="상세주소">
                        <input type="text" id="sample3_extraAddress" placeholder="참고항목">
                        <button> 동네 바꾸기 </button>
                        -->

                    
                        <!-- 2안 지오로케이션 등 현재 위도 경도, 혹은 위치 활용해서 주소 뽑기,,-->
                        <button> 현재 위치로 동네 바꾸기 </button>

        
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

