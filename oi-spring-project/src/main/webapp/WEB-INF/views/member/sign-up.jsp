<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입| 오이마켓</title>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" integrity="sha512-IJEbgDEF7OeKJRa0MY2PApnyJHRIsgzCveek4ec8VWQ+7KG3ZSKVNYa5xP/Gh0hVP0Mwb+gBsk+GwR3JQGhQNg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
       <!-- 먼저 호출되야함 reset! -->
       <link rel="stylesheet" href="../css/mainScss.css">
     <link rel="stylesheet" href="../css/main.css">
     <link rel="stylesheet" href="../css/sign-up.css">
  
</head>
<body>
     <div class="body__container">


      

        <header class="sign-up-head">
            <div class="inner clearfix">
                    <div class="menu-group float--left">
                        <div class="logo">
                            <a href="#">oi</a>
                        </div>
                    </div>
                </div>
    </header>



        

        <!-- contents -->
    

        <section  class="sign-up-body">
            <div class="text-center my-0 mx-auto">
                <h1 class="font-weight-bold pb-5 fs-2 my-4 fw-bold">계정 만들기</h1>
                <div class="d-grid col-12 col-md-12 mx-auto">
                    <button class="btn btn-primary mb-2 py-2">소셜로그인</button>
                    <button class="btn btn-secondary mb-2 py-2">일단 넣어놈</button>
                    <button class="btn btn-dark py-2">삭제 가능</button>
                    
                </div>

              
                <form action="#" method="POST" class="mt-5 row text-start">


                    <div class="inputs">
                        <div class=" ps-1 mb-1 cfs-2 ">아이디</div>
                        <input name="username" placeholder="아이디" class="col-12 input--text mb-3">
                        <div class=" ps-1 mb-1 cfs-2">비밀번호(제약사항 여기 적어주세요)</div>
                        <input name="username" placeholder="비밀번호" class="col-12 input--text mb-3">
                        <div class=" ps-1 mb-1 cfs-2">비밀번호 확인</div>
                        <input name="username" placeholder="비밀번호 확인" class="col-12 input--text mb-3">
                        
                        <div class=" ps-1 mb-1 cfs-2">이름</div>
                        <input name="username" placeholder="이름" class="col-12 input--text mb-3">
                        
                        <div class=" ps-1 mb-1 cfs-2">별명</div>
                        <input name="username" placeholder="별명" class="col-12 input--text mb-3">
                        
                        <div class=" ps-1 mb-1 cfs-2">전화번호</div>
                        <input name="username" placeholder="전화번호" class="col-12 input--text mb-3">
                        
                        <div class=" ps-1 mb-1 cfs-2">이메일</div>
                        <input name="username" placeholder="이메일" class="col-12 input--text mb-3">
                        
                        <div class=" ps-1 mb-1 cfs-2">위치</div>
                        <input name="username" placeholder="위치" class="col-12 input--text mb-3">
                    </div>
                    
                    <div class="agrees mb-4">
                        <label class="checkbox-inline">
                            <input type="checkbox"  value="option1">
                            <a href="#">이용약관</a> 및 <a href="#">개인정보 처리 방침</a>에 동의
                        </label>
                    </div>
                    
                    
                    
                    <div class="buttons text-center d-grid">
                                                    <!-- 비활성화 된 버튼 -->
                        <input type="button" class="btn mybtn mybtn--primary disabled mb-4 sign-up-btn" value="계정 만들기">
                                                    <!--  활성화 된 버튼  -->
                        <!-- <input type="button" class="mybtn mybtn--primary mb-5 sign-up-btn" value="계정 만들기"> -->
                    </div>
                
                </form>

                <div class="anotherLogin">
                    <p class="mb-5 pb-5 cfs-2">이미 회원이신가요? <a href="#">로그인하기</a></p>
                </div>

            </div>


       
    
        </section>
      


     </div>

</body>
</html>