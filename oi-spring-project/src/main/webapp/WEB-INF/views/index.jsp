<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오이마켓</title>

    <meta name="author" content="wook">
    <meta name="description" content="GitHub practice project">
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" integrity="sha512-IJEbgDEF7OeKJRa0MY2PApnyJHRIsgzCveek4ec8VWQ+7KG3ZSKVNYa5xP/Gh0hVP0Mwb+gBsk+GwR3JQGhQNg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <!-- 먼저 호출되야함 reset! -->
    <link rel="stylesheet" href="./css/main.css">

  
</head>
<body>
     <div class="body__container">


        <!-- HEADER -->
        <header class="section">
                <div class="inner clearfix">
                        <div class="menu-group float--left">
                            <div class="logo">
                                <a href="#">github</a>
                            </div>
                            <ul class="main-menu toggle">
                                <li><a href="#">동네 생활</a></li>
                                <li><a href="#">내 근처</a></li>
                            </ul>
                        </div>


                        <div class="sign-group float--right toggle">
                            <div class="btn-group">
                                <a href="#" class="mybtn sign-in">로그인</a>
                                <a href="#" class="mybtn mybtn--primary sign-up">회원가입</a>
                            </div>
                            <form id="search-form" action="#" method="POST">
                                <input id="search" type="text" class="input--text" placeholder="물품명을 검색해보세요!">
                                <input type="submit" value="submit">
                            </form>
                            <ul class="sub-menu">
                                <li><a href="#">채팅</a></li>
                                <li><a href="#">나의 당근</a></li>
                                <li><a href="#">판매하기</a></li>
                            </ul>
                        </div>

                        <div id="toggle-btn">Header Menu Toggle Button</div>
                        <!-- <div class="clearfix" style="clear: both;">
                                    (토글버튼)
                        </div> -->
                    </div>
        </header>

    
     <section class="section section--visual1">
         <div class="inner">
             <div class="summary">

                <div class="summary__title">
                   <p> 당신 근처의<br>오이마켓</p>
                </div>

                <div class="summary__description">
                    중고 거래부터 동네 정보까지 이웃과 함께해요.<br>
                    가깝고 따뜻한 당신의 근처를 만들어요.
                </div>
            </div>
                <div class="summaryImg">
                </div>
      
         </div>
     </section>

     
     <section class="section section--visual2">
         <div class="inner">

                <div class="summaryImg">
                    
                </div>
             
                 <div class="summary">

                    <div class="summary__title">
                    <p> 우리 동네<br>중고 직거래 마켓</p>
                    </div>

                    <div class="summary__description">
                        동네 주민들과 가깝고 따듯한 거래를 지금 경험해보세요.
                    </div>
                    
                    <div class="summary__buttonGroup">
                        <a href="#" class="mybtn">인기매물 보기</a>
                        <a href="#" class="mybtn">믿을 수 있는 중고 거래</a>
                    </div>

                </div>
         </div>
     </section>

     <section class="section section--visual3">
        <div class="inner">

            
            <div class="summary">
                
                <div class="summary__title">
                    <p> 이웃과 함께하는<br>동네 생활</p>
                </div>
                
                <div class="summary__description">
                    우리 동네의 다양한 이야기를 이웃과 함께 나누어요.
                </div>
                
                <div class="summary__icon">
                    <div class="icon">
                        <div id="summary__iconImg1"></div>
                        <p>우리동네질문</p>
                        <p>궁금한 게 있을 땐<br>이웃에게 물어보세요</p>
                    </div>
                     <div class="icon">
                        <div id="summary__iconImg2"></div>
                        <p>동네분실센터</p>
                        <p>무언가를 잃어버렸을 때,<br>함께 찾을 수 있어요.</p>
                    </div>
                     <div class="icon">
                        <div id="summary__iconImg3"></div>
                        <p>동네모임</p>
                        <p>관심사가 비슷한 이웃과<br>온 오프라인으로 만나요.</p>
                    </div>
                </div>
                
            
            </div>

                <div class="summaryImg">
               
                </div>

         </div>  
    </section>


    <section class="section popular-product"> 
        <div class="inner">

            <div class="popular-product__title">
                <p>중고거래 인기매물</p>
            </div>

            <div class="popular-product__list">
                <div class="product">
                    <a href="#">
                    <div class="productImgBox">
                        <img class="productImg" src="https://dnvefa72aowie.cloudfront.net/origin/article/202105/0eaaee503ca4789c5af2aaaa3b2fa241d9f867affd453b97e96b34fb847bcce5.webp?q=82&s=300x300&t=crop" alt="">
                    </div>
                    <div class="productName">위닉스 제습기</div>
                    <div class="productAmount">80,000</div>
                    <div class="productLocation">대전 서구</div>
                    <div class="productLike">관심16</div>
                    </a>
                </div>
                <div class="product">
                    <a href="#">
                        <div class="productImgBox">
                            <img class="productImg" src="https://dnvefa72aowie.cloudfront.net/origin/article/202105/0eaaee503ca4789c5af2aaaa3b2fa241d9f867affd453b97e96b34fb847bcce5.webp?q=82&s=300x300&t=crop" alt="">
                        </div>
                        <div class="productName">위닉스 제습기</div>
                        <div class="productAmount">80,000</div>
                        <div class="productLocation">대전 서구</div>
                        <div class="productLike">관심16</div>
                        </a>
                </div>
                <div class="product">
                    <a href="#">
                        <div class="productImgBox">
                            <img class="productImg" src="https://dnvefa72aowie.cloudfront.net/origin/article/202105/0eaaee503ca4789c5af2aaaa3b2fa241d9f867affd453b97e96b34fb847bcce5.webp?q=82&s=300x300&t=crop" alt="">
                        </div>
                        <div class="productName">위닉스 제습기</div>
                        <div class="productAmount">80,000</div>
                        <div class="productLocation">대전 서구</div>
                        <div class="productLike">관심16</div>
                        </a>
                </div>
                <div class="product">
                    <a href="#">
                        <div class="productImgBox">
                            <img class="productImg" src="https://dnvefa72aowie.cloudfront.net/origin/article/202105/0eaaee503ca4789c5af2aaaa3b2fa241d9f867affd453b97e96b34fb847bcce5.webp?q=82&s=300x300&t=crop" alt="">
                        </div>
                        <div class="productName">위닉스 제습기</div>
                        <div class="productAmount">80,000</div>
                        <div class="productLocation">대전 서구</div>
                        <div class="productLike">관심16</div>
                        </a>
                </div>
                <div class="product">
                    <a href="#">
                        <div class="productImgBox">
                            <img class="productImg" src="https://dnvefa72aowie.cloudfront.net/origin/article/202105/0eaaee503ca4789c5af2aaaa3b2fa241d9f867affd453b97e96b34fb847bcce5.webp?q=82&s=300x300&t=crop" alt="">
                        </div>
                        <div class="productName">위닉스 제습기</div>
                        <div class="productAmount">80,000</div>
                        <div class="productLocation">대전 서구</div>
                        <div class="productLike">관심16</div>
                        </a>
                </div>
                <div class="product">
                    <a href="#">
                        <div class="productImgBox">
                            <img class="productImg" src="https://dnvefa72aowie.cloudfront.net/origin/article/202105/0eaaee503ca4789c5af2aaaa3b2fa241d9f867affd453b97e96b34fb847bcce5.webp?q=82&s=300x300&t=crop" alt="">
                        </div>
                        <div class="productName">위닉스 제습기</div>
                        <div class="productAmount">80,000</div>
                        <div class="productLocation">대전 서구</div>
                        <div class="productLike">관심16</div>
                        </a>
                </div>
                <div class="product">
                    <a href="#">
                        <div class="productImgBox">
                            <img class="productImg" src="https://dnvefa72aowie.cloudfront.net/origin/article/202105/0eaaee503ca4789c5af2aaaa3b2fa241d9f867affd453b97e96b34fb847bcce5.webp?q=82&s=300x300&t=crop" alt="">
                        </div>
                        <div class="productName">위닉스 제습기</div>
                        <div class="productAmount">80,000</div>
                        <div class="productLocation">대전 서구</div>
                        <div class="productLike">관심16</div>
                        </a>
                </div>
                <div class="product">
                    <a href="#">
                        <div class="productImgBox">
                            <img class="productImg" src="https://dnvefa72aowie.cloudfront.net/origin/article/202105/0eaaee503ca4789c5af2aaaa3b2fa241d9f867affd453b97e96b34fb847bcce5.webp?q=82&s=300x300&t=crop" alt="">
                        </div>
                        <div class="productName">위닉스 제습기</div>
                        <div class="productAmount">80,000</div>
                        <div class="productLocation">대전 서구</div>
                        <div class="productLike">관심16</div>
                        </a>
                </div>
            </div>


            <div class="moreProduct">
                <a href="#">더보기</a>
            </div>
          
            


        </div>
    </section>


        <!-- FOOTER -->
        <footer class="section">
            <div class="inner">

                
                <div class="inner-top">
                    <span href="#" class="logo">oi-market</span>
                     <ul class="site-links site-links-important">
                        <li><a href="#">믿을 수 있는 중고 거래</a></li>
                        <li><a href="#">자주 묻는 질문</a></li>
                     </ul>
                     <ul class="site-links">
                        <li><a href="#">회사 소개</a></li>
                        <li><a href="#">광고주 센터</a></li>
                        <li><a href="#">동네 가게</a></li>
                     </ul>
                     <ul class="site-links">
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">위치기반서비스 이용약관</a></li>
                     </ul>
                </div>

                <div class="inner-bottom">
                    <ul class="copyright-list">
                        <li>고객 문의 
                            <a href="mailto:cs@oiservice.com">&nbsp; cs@oiservice.com</a>
                        </li>
                        <li>제휴 문의
                        <a href="mailto:contact@oiservice.com">&nbsp;contact@oiservice.com</a>
                    </li>
                </ul>
                <ul class="copyright-list">
                    <li>지역 광고 
                        <a href="mailto:ad@oiservice.com">&nbsp;ad@oiservice.com</a>
                    </li>
                    <li>PR 문의
                        <a href="mailto:pr@oiservice.com">&nbsp;pr@oiservice.com</a>
                        </li>         
                    </ul>
                    <ul class="copyright-list copyright-list-bottom">
                        <li>서울 마포구 월드컵북로 21 풍성빌딩 2층</li>
                        <li>사업자 등록번호 : 2019-1001</li>
                    </ul>
                    <ul class="copyright-list">
                        <li>@Oi Market Inc.</li>
                    </ul>
                </div>

            </div>
        </footer>


     </div>

     <script src="./js/main.js"></script>
     <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</body>
</html>