<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>동네 생활|오이마켓</title>

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
    <link rel="stylesheet" href="../css/neighborhood.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <!-- jsp로 바꿀때 경로 신경쓰기 -->
  
</head>
<body>
     <div class="body__container">


       <!-- HEADER -->
       <c:import url="../template/header.jsp"></c:import>

   <header class="section section--second-header">
        <div class="inner inner--second">
            <div class="inner--left toggle--small">
                <div class="inner__dropdown">
                    <a href="#" class="dropbtn">
                        철산 1동<i class="bi bi-caret-right-fill"></i>
                    </a>
                    <div class="dropdown-content">
                        <a href="#">동네 바꾸기</a>
                    </div>
                </div>
                <div class="inner__dropdown inner__dropdown--category">
                    <a href="#" class="dropbtn">
                        전체보기<i class="bi bi-caret-right-fill"></i>
                    </a>
                    <div class="dropdown-content">
                        <a href="#">같이 해요</a>
                        <a href="#">동네 질문</a>
                        <a href="#">해주세요</a>
                        <a href="#">동네 맛집</a>
                        <a href="#">일상</a>
                        <a href="#">기타</a>
                    </div>
                </div>
            </div>
            <div class="inner__right toggle--small">
                
                <a href="#">
                    <i class="bi bi-pencil-fill"></i> 글쓰기
                </a>
                <form id="search-form--village" action="#" method="POST">
                    <input id="search" type="text" class="input--text" placeholder="동네 정보를 검색하세요!">
                    <input type="submit" value="submit">
                </form>

            </div>
            <button id="toggle-btn--village">
                <i class="bi bi-list"></i>
            </button>

        </div>

    </header>


    
     <section class="section article">
         <div class="inner">

            <div class="post-list">

                <a href="#">
                    <div class="post-list__header">
                        우리동네질문
                    </div>
                    <div class="post-list__content">
                        <p class="content__article">
                            개봉역 앞 필라테스 모드온 괜찮은가유?
                        </p>
                        <div class="content__info">
                            <div class="info__left">
                                <div class="info--user">우기</div>
                                <div class="info--location">개봉3동</div>
                            </div>
                            <div class="info--date">2시간 전</div>
                        </div>
                    </div>
                    <div class="post-list__footer">
                            <div class="footer--wrap">
                                <div class="post-list--like">좋아요 3</div>
                                <div class="post-list--comment">댓글 1</div>
                            </div>
                    </div>
                </a>
                
            </div>
            <div class="post-list">

                <a href="#">
                <div class="post-list__header">
                    우리동네질문
                </div>
                <div class="post-list__content">
                    <p class="content__article">
                       Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, iste nemo, corporis quo minima vero numquam ad rem doloremque porro iusto. Porro dolorem minima, quod modi tenetur vero similique maiores.
                    </p>
                    <div class="content__info">
                        <div class="info__left">
                            <div class="info--user">우기</div>
                            <div class="info--location">개봉3동</div>
                        </div>
                        <div class="info--date">2시간 전</div>
                    </div> 
                </div>
                <div class="post-list__footer">
                        <div class="footer--wrap">
                            <div class="post-list--like">좋아요 3</div>
                            <div class="post-list--comment">댓글 1</div>
                        </div>
                </div>
                </a>

            </div>
            <div class="post-list">

                <a href="#">
                    <div class="post-list__header">
                        우리동네질문
                    </div>
                    <div class="post-list__content">
                        <p class="content__article">
                            개봉역 앞 필라테스 모드온 괜찮은가유?
                        </p>
                        <div class="content__info">
                            <div class="info__left">
                                <div class="info--user">우기</div>
                                <div class="info--location">개봉3동</div>
                            </div>
                            <div class="info--date">2시간 전</div>
                        </div>
                    </div>
                    <div class="post-list__footer">
                            <div class="footer--wrap">
                                <div class="post-list--like">좋아요 3</div>
                                <div class="post-list--comment">댓글 1</div>
                            </div>
                    </div>
                </a>
                
            </div>
            <div class="post-list">

                <a href="#">
                    <div class="post-list__header">
                        우리동네질문
                    </div>
                    <div class="post-list__content">
                        <p class="content__article">
                            개봉역 앞 필라테스 모드온 괜찮은가유?
                        </p>
                        <div class="content__info">
                            <div class="info__left">
                                <div class="info--user">우기</div>
                                <div class="info--location">개봉3동</div>
                            </div>
                            <div class="info--date">2시간 전</div>
                        </div>
                    </div>
                    <div class="post-list__footer">
                            <div class="footer--wrap">
                                <div class="post-list--like">좋아요 3</div>
                                <div class="post-list--comment">댓글 1</div>
                            </div>
                    </div>
                </a>
                
            </div>
            <div class="post-list">

                <a href="#">
                    <div class="post-list__header">
                        우리동네질문
                    </div>
                    <div class="post-list__content">
                        <p class="content__article">
                            개봉역 앞 필라테스 모드온 괜찮은가유?
                        </p>
                        <div class="content__info">
                            <div class="info__left">
                                <div class="info--user">우기</div>
                                <div class="info--location">개봉3동</div>
                            </div>
                            <div class="info--date">2시간 전</div>
                        </div>
                    </div>
                    <div class="post-list__footer">
                            <div class="footer--wrap">
                                <div class="post-list--like">좋아요 3</div>
                                <div class="post-list--comment">댓글 1</div>
                            </div>
                    </div>
                </a>
                
            </div>

            <div class="paging-nav">
                <ul>
                    <li>
                        <a href="#">
                            <i class="bi bi-chevron-left"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            1
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            2
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            3
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            4
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </li>
   
                </ul>
            </div>
            </div>
            
            
            
            
            
        
     </section>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>

     </div>
     <script src="../js/main.js"></script>
     <script src="../js/neighborhood.js"></script>


</body>
</html>

