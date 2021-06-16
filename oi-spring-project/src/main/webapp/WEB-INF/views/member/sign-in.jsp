<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 | 오이마켓</title>

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
        <link rel="stylesheet" href="../css/member.css">

  
</head>
<body>
     <div class="body__container">


      

        <header class="sign-in-head">
            <div class="inner clearfix">
                    <div class="menu-group float--left">
                        <div class="logo">
                            <a href="${pageContext.request.contextPath}/">oi</a>
                        </div>
                    </div>
                </div>
    </header>



        

        <!-- contents -->
    

        <section  class="section sign-in">
            <div class="sign-in-body">
                <h1>로그인</h1>
                <div class="d-grid col-12 mx-auto">
                    <button class="btn btn-primary">소셜로그인으로 계속하기</button>
                    <button class="btn btn-secondary">일단 넣어놈</button>
                    <button class="btn btn-dark">삭제 가능</button>
                    
                </div>

              
                <form action="./memberLogin" method="post" class="sign-in-frm row">


                         <div class="inputs">
                        <div id="id-input">
                            <p>
                                아이디
                            </p>
                            <p>
                                <a href="${pageContext.request.contextPath}/member/find-id">아이디 찾기</a>
                            </p>
                        </div>
                        <input id="username" name="username" placeholder="아이디"  class="col-12 input--text">
                        <div id="pw-input">
                            <p>
                                비밀번호
                            </p>
                            <p>
                                <a href="${pageContext.request.contextPath}/member/find-pw">비밀번호 찾기</a>
                            </p>
                        </div>
                        <input type="password" id="password" name="password" placeholder="비밀번호" class="col-12 input--text">
                    </div>
                    
                   
                    <div class="d-grid">
                        <input type="submit" class="mybtn mybtn--primary mb-5 sign-up-btn" value="로그인">
                    </div>
                
                </form>

                <div class="anotherLogin">
                    <p>회원이 아니신가요? <a href="${pageContext.request.contextPath}/member/sign-up">가입하기</a></p>
                  
                </div>

            </div>


       
    
        </section>
      


     </div>

</body>
</html>