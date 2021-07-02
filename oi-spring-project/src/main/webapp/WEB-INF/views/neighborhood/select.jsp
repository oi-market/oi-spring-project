<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
  
    <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
    <link rel="icon" href="../favicon.ico">
    <link rel="apple-touch-icon" href="../favicon.ico">
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
                        ${vo.category}
                    </div>
                    
                    <div class="content__info content__info--post">


					  <!-- 프로필 이미지 변경부분!! -->
						
                      <div>
                      	<c:if test="${writerImg eq null}"><img class="select-img-size" id="account-image-preview" src="../img/default-user-picture.png"  alt="profile_image"></c:if>
					  	<c:if test="${writerImg ne null}"><img class="select-img-size" id="account-image-preview" src="../upload/member/${writerImg}" alt="profile_image"></c:if>	
                      </div>
	                        <div class="info--users">
	                            <div class="info--user">${vo.nickName}</div>
	                            <div class="info--second-line">
	                                <div class="info--location">
	                                	${cutLocation}
	                                </div>
	                                <div>&ensp;·&ensp;</div>
	                                <div class="info--date">${vo.regDate}</div>
	                            </div>
	                        </div>
						
						
						<c:if test="${vo.writer eq session}">
	                        <div class="info--modify inner__dropdown"> 
	                                    
	                            <button class="dropbtn">
	                                <i class="bi bi-three-dots-vertical"></i>
	                            </button>
	                            
								
	                            <div class="dropdown-content">
                                	<a href="./update?num=${vo.num}">수정하기</a> 
                                	<a href="./delete?num=${vo.num}">삭제하기</a>   
	                            </div>
	                            
	                        
	                        </div>
						</c:if> 

                    </div>
                    
                   
                    <div class="post-list__content post-list__content--post">
                        <p class="content__article">
                            ${vo.contents}
                        </p>
                    </div>
                    <div class="post-list__footer post-list__footer--post">
                            <div class="footer--wrap footer--wrap--post">
                                
                                <a href="#">
                                    <div class="post-list--comment">댓글 ${count}</div>
                                </a>
                                
                            </div>
                    </div>
                    
                    
                    <div class="comment-list">

						<c:if test="${comments ne null}">
							<c:forEach items="${list}" var="comments">
							
		                        <div class="comment">
		
		                            <div class="comment--header">
		                                <div class="content__info content__info--post">
		                                	
		                                	<c:if test="${comments.depth>1}">
		                                		<img alt="enter-arrow" src="../img/nei-reply.png"
														style="width:5%; height: 50%; margin-right:5%; " />
		                                	</c:if>

		                                	
		                                	<!-- 프로필 이미지 변경부분!! -->
		                                	
		                                    <div>
		                                    
		                                  
		                                    	<c:if test="${comments.memberFileVO.fileName eq null}"><img class="select-img-size" id="account-image-preview" src="../img/default-user-picture.png"  alt="profile_image"></c:if>
					  							<c:if test="${comments.memberFileVO.fileName ne null}"><img class="select-img-size" id="account-image-preview" src="../upload/member/${comments.memberFileVO.fileName}" alt="profile_image"></c:if>	

		                                    </div>
		                                    <div class="info--users">
		                                        <div class="info--user">${comments.nickName}</div>
		                                        <div class="info--second-line">
		                                            <div class="info--location">${cutLocation}</div>
		                                            <div>&ensp;·&ensp;</div>
		                                            <div class="info--date">${comments.regDate}</div>
		                                        </div>
		                                    </div>
		                                    
		                                </div>
		                                
										<c:if test="${comments.writer eq session}">
			                                <div class="comment--modify inner__dropdown"> 
			                                    
			                                    <button class="dropbtn">
			                                        <i class="bi bi-three-dots-vertical"></i>
			                                    </button>
			
			                                    <div class="dropdown-content">
			                                        <a href="../comments/commentsDelete?num=${comments.num}">삭제</a>
			                                    </div>
			                                
			                                </div>
		                                </c:if>

		                                
		                            </div>
															
		                            <div class="comment--body" <c:if test="${comments.depth>1}">style="margin-left:11%"</c:if>>	                            
		                                ${comments.contents}      
		                            </div>
		                            
		                            <c:if test="${comments.depth<2}">
			                            <div class="comment--footer" <c:if test="${comments.depth>1}">style="margin-left:17%"</c:if>>   
			                                <button class="comment--reply">답글달기</button>
			                            </div>
		                            </c:if>
		
		                            <div class="comment-insert comment-insert--reply"> 
			                        	<form id="form" action="../comments/commentsInsert" method="post">
			                                
			                                <input type="hidden" id="communityNum" name="communityNum" value="${vo.num}">
			                                <input type="hidden" id="num" name="num" value="${comments.num}">
			                            	<input type="text" placeholder="답글을 입력해주세요!" id="contents" name="contents" class="comment--input input--text">
			                                
			                               <button type="submit">
			                                    <i class="bi bi-pencil"></i>
			                                </button>

			                            </form> 
		                            </div>
		
		
		                        </div>
	                        </c:forEach>
                        </c:if>

                        
                    
                    <!-- 댓글 -->
                    <div class="comment-insert" name="comments"> 
                        <form id="form" action="../comments/commentsInsert" method="post">
                        	<input type="hidden" id="communityNum" name="communityNum" value="${vo.num}">
		                    <input type="text" placeholder="따뜻한 댓글을 입력해주세요!" id="contents" name="contents" class="comment--input input--text">

                            <button type="submit">
                                 <i class="bi bi-pencil"></i>
                            </button>
		                    
                    	</form>
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

