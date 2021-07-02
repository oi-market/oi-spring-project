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
    
    <style type="text/css">
    	/*말줄임 css*/
	    .box {
		    display: -webkit-box;
		    height: 100px;/*줄일 높이?*/
		    word-wrap: break-word;
		    -webkit-line-clamp: 3;	/*보여주고싶은 줄 수*/
		    -webkit-box-orient: vertical;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    margin-bottom: 3%;
		}
    </style>
    
  
</head>
<body>
     <div class="body__container">


       <!-- HEADER -->
       <c:import url="../template/header.jsp"></c:import>
       <c:import url="../template/header-neiborhood.jsp"></c:import>
		
  

    
     <section class="section article">
         <div class="inner">
			<c:forEach items="${list}" var="vo" varStatus="i">
	            <div class="post-list">
	
	                <a href="./select?categoryNum=${vo.categoryNum}&&num=${vo.num}&&communityNum=${vo.num}">
	                    <div class="post-list__header">
	                        ${vo.category}
	                    </div>
	                    <div class="post-list__content box">
	                        <p class="content__article">
	                            ${vo.contents}
	                        </p>
	                    </div>
	                    
	                    <div class="content__info">
                           <div class="info__left">
                               <div class="info--user">${vo.nickName}</div>
                               <div>&ensp;·&ensp;</div>
                               <div class="info--location">
                               		${cutLocation}
                               </div>
                           </div>
                           <div class="info--date">${vo.regDate}</div>
	                    </div>
	                    
	                    <div class="post-list__footer">
	                            <div class="footer--wrap">
	                                <!--<div class="post-list--like">좋아요 3</div> ${count}-->
	                                  <div class="post-list--comment">댓글 ${count[i.index]}</div>
	                            </div>
	                    </div>
	                </a>
	                
	            </div>
            </c:forEach>
            
            
			<c:if test="${size ne 0}">
	            <div class="paging-nav">
	                <ul>
	 					<c:if test="${communityPager.pre}">	
						   <li style="width:10%"><a class="pager" href="#" title="${communityPager.startNum-1}">
						   
							   	<img alt="enter-arrow" src="../img/nei-pre.png"
								style="width:200%; margin-top:80%" />
						   
						   </a></li>
						</c:if>
			   
				   	  	<c:forEach begin="${communityPager.startNum}" end="${communityPager.lastNum}" var="i">
				   			<li><a class="pager" href="#" title="${i}">${i}</a></li>
				   	  	</c:forEach>
			   
				      	<c:if test="${communityPager.next}">
				      		<li style="width:10%"><a class="pager" href="#" title="${communityPager.lastNum+1}">
				      		
					      		<img alt="enter-arrow" src="../img/nei-next.png"
								style="width:60%; margin-top:20%" />
				      		
				      		</a></li>
				      	</c:if>
	   
	                </ul>
	                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	                <script type="text/javascript">
		
						$(".pager").click(function() {
							let curPage = $(this).attr("title");
							$("#curPage").val(curPage);
							let search = '${communityPager.search}';
							$("#search2").val(search);
							let categoryNum = '${communityPager.categoryNum}';
							$("#categoryNum").val(categoryNum);
							//alert($("#categoryNum").val());
							//alert($("#search2").val());
							$("#search-form--village").submit();
						
						});
				
					</script> 
	                
	                
	            </div>
            </c:if>
            
            <c:if test="${size eq 0}">
            
            	<img alt="no-contents" src="../img/nei-no-contents.png" style="width:50%;" />
            
            </c:if>
            
            
         </div>
            
        
     </section>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>

     </div>
     <script src="../js/main.js"></script>
     <script src="../js/neighborhood.js"></script>


</body>
</html>

