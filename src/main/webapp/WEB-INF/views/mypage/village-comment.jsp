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
         <c:import url="../template/mypage-nav.jsp"></c:import>  
           

           <div class="content">
           
           <div class="content-header">
               <h1 class="page-name">동네생활 댓글</h1>
           </div>
           
            <div class="village-body">
               
               
   <%-- db에서 넘겨줄때 :  <c:forEach var="i" items="${comment}" varStatus="true"> --%>
						
						<c:forEach items="${comment}" var="vo" begin="0" end="4" >
                <div class="comment-bundle">
               
                    <a href=" ${pageContext.request.contextPath}/neighborhood/select?categoryNum=${vo.communityVO.categoryNum}&&num=${vo.communityNum}&&communityNum=${vo.communityNum}" class="post-bundle">
                    
                        <p class="post--content">
                            ${vo.contents}
                        </p>
                        <div class="post--small-service">
                            <div class="like commentTitle">${vo.communityVO.contents}</div>
                            <div class="comment">${vo.regDate}</div>
                        </div>
                    </a>
                    
                    
                    
                        
                        
                       
                    
                </div>
                     </c:forEach>


                

           

          
            </div>
           
       </div>
       
    </div>
</section>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>

     </div>
     <script src="../js/main.js"></script>
     <script type="text/javascript">
 	
     let commentTitles = document.querySelectorAll('.commentTitle');

 	for(let commentTitle of commentTitles){
 		let str = commentTitle.innerHTML;
 		let nextText =str.replace(/(<([^>]+)>)/ig,"");
 		nextText='글 제목: '+nextText.substring(0,5)+'...';
 		commentTitle.innerHTML=nextText;
 							
 	}


     
     </script>
     <script src="../js/myPage.js"></script>


</body>
</html>