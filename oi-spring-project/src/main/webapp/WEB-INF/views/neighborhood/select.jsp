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
       <c:import url="../template/header-neiborhood.jsp"></c:import>
	
  


    
     <section class="section article">
         <div class="inner">

            <div class="post-list post">

               
                    <div class="post-list__header">
                        우리동네질문
                    </div>
                    
                    
                    
                                 <div class="content__info content__info--post">
                        <div class="info--photo">
                        	<img src="../img/default-user-picture.png">
                        </div>
                        <div class="info--users">
                            <div class="info--user">우기</div>
                            <div class="info--second-line">
                                <div class="info--location">개봉3동</div>
                                <div class="info--date">2시간 전</div>
                            </div>
                        </div>

                        <div class="info--modify inner__dropdown"> 
                                    
                            <button class="dropbtn">
                                <i class="bi bi-three-dots-vertical"></i>
                            </button>

                            <div class="dropdown-content">
                                <a href="#">수정하기</a>
                                <a href="#">삭제하기</a>
                                <a href="#">새로고침</a>
                            </div>
                        
                        </div>


                    </div>
                    
                    
                    
                    
                    
                    <div class="post-list__content post-list__content--post">
                        <p class="content__article">
                            개봉역 앞 필라테스 모드온 괜찮은가유?
                        </p>
                    </div>
                    <div class="post-list__footer post-list__footer--post">
                            <div class="footer--wrap footer--wrap--post">
                                <a href="#">
                                    <i class="bi bi-emoji-smile"></i>
                                    <div class="post-list--like">공감하기 3</div>
                                </a>
                                <a href="#">
                                    <div class="post-list--comment">댓글 1</div>
                                </a>
                            </div>
                    </div>
                    <div class="comment-list">

                        <div class="comment">

                            <div class="comment--header">
                                <div class="content__info content__info--post">
                                    <div class="info--photo">
                                    	<img src="../img/default-user-picture.png">
                                    </div>
                                    <div class="info--users">
                                        <div class="info--user">우기</div>
                                        <div class="info--second-line">
                                            <div class="info--location">개봉3동</div>
                                            <div class="info--date">2시간 전</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment--modify inner__dropdown"> 
                                    
                                    <button class="dropbtn">
                                        <i class="bi bi-three-dots-vertical"></i>
                                    </button>

                                    <div class="dropdown-content">
                                        <a href="#">삭제</a>
                                    </div>
                                
                                </div>
                            </div>

                            <div class="comment--body">
                                동양 미래대학 쪽에 돔타이마시라고 있어요. 엄청 시원합니다 !!
                            
                            </div>
                            <div class="comment--footer">   
                                <button class="comment--reply">답글달기</button>
                            </div>

                            <div class="comment-insert comment-insert--reply"> 
                        
                                <input type="text" placeholder="답글을 입력해주세요!" class="comment--input input--text">
                                
                                <a href="#">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                
                            </div>


                        </div>
                        <div class="comment">

                            <div class="comment--header">
                                <div class="content__info content__info--post">
                                    <div class="info--photo">
										<img src="../img/default-user-picture.png">
									</div>
                                    <div class="info--users">
                                        <div class="info--user">우기</div>
                                        <div class="info--second-line">
                                            <div class="info--location">개봉3동</div>
                                            <div class="info--date">2시간 전</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment--modify inner__dropdown"> 
                                    
                                    <button class="dropbtn">
                                        <i class="bi bi-three-dots-vertical"></i>
                                    </button>

                                    <div class="dropdown-content">
                                        <a href="#">삭제</a>
                                    </div>
                                
                                </div>
                            </div>

                            <div class="comment--body">
                                동양 미래대학 쪽에 돔타이마시라고 있어요. 엄청 시원합니다 !!
                            
                            </div>
                            <div class="comment--footer">   
                                <button class="comment--reply">답글달기</button>
                            </div>

                            <div class="comment-insert comment-insert--reply"> 
                        
                                <input type="text" placeholder="답글을 입력해주세요!" class="comment--input input--text">
                                
                                <a href="#">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                
                            </div>

                        </div>


                    </div>
                    <div class="comment-insert"> 
                        
                    <input type="text" placeholder="따뜻한 댓글을 입력해주세요!" class="comment--input input--text">
                    
                    <a href="#">
                        <i class="bi bi-pencil-fill"></i>
                    </a>
                    
                    </div>
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

