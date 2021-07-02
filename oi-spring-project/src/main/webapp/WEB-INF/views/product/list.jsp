<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>중고 거래|오이마켓</title>

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
    <link rel="stylesheet" href="../css/product.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <!-- jsp로 바꿀때 경로 신경쓰기 -->
  
</head>
<body>
     <div class="body__container">


       <!-- HEADER -->
       <c:import url="../template/header.jsp"></c:import>
       <c:import url="../template/header-product.jsp"></c:import>
       
	

   


    
     <section class="section article article--product">
         <div class="inner">

            <!-- 
           
            
 -->
         
 	
            <div class="product-list">

		<c:forEach items="${list}" var="vo">
                <a href="./select?num=${vo.num}">
                    <div class="product">
                        <div class="product--header">
                            <img class="product--image" src="../resources/upload/images${vo.productFiles[0].thumbnail}" alt="대체텍스트">
                            <div class="product--name">${vo.title}</div>
                            <c:if test="${vo.sale eq 0}">
                            	<div class="product--image-soldout">판매완료</div>
                            </c:if>
                        </div>
                        <div class="product--location">${vo.location}</div>
                        <div class="product--footer">
                            <div class="product--amount">${vo.price}</div>
                            <div class="product--like">
                                <i class="bi bi-suit-heart"></i>
                                ${vo.wish}</div>
                        </div>
                    </div>  
                </a>
     </c:forEach>
        

            </div>





<%-- 

  <!-- 페이지 밑 번호로 이동할수 있는 블럭  -->
 <div class="container d-flex justify-content-center">
  <ul class="pagination">
  
  
    <li class="page-item">
    	<a class="page-link pager" th:if="${pager.pre}" href="#" th:title="${pager.startNum-1}">Previous</a>
    <!--  th:href="@{./list(curPage=${pager.startNum}-1)}"-->
    	<span class="page-link" th:unless="${pager.pre}">Previous</span>
    </li>
    
    
    <li class="page-item" th:each="i : ${#numbers.sequence(pager.startNum,pager.lastNum)}">
    <a class="page-link pager" th:text="${i}" href="#" th:title="${i}">1</a>
    <!-- th:href="@{./list(curPage=${i})}" -->
    </li>
    
    
    
    <li class="page-item" th:if="${pager.next}">
    <a class="page-link pager" href="#"  th:title="${pager.lastNum+1}">Next</a>
    </li>
    <!--  th:href="@{./list(curPage=${pager.lastNum}+1)}" -->
  </ul>
</div>
  
  
  
  
 --%>


            <div class="paging-nav">
            
            
                <ul>
                
                	
                
                	<c:if test="${pager.pre}">                	
                		<c:choose>
                	
                			<c:when test="${empty productVO}">
			                    <li>
			                        <a href="./list?curPage=${pager.startNum-1}">
			                            <i class="bi bi-chevron-left"></i>
			                        </a>
			                    </li>
                   			 </c:when>
                    
                			<c:when test="${not empty productVO}">
			                    <li>
			                        <a href="./list?categoryNum=${productVO.categoryNum}&curPage=${pager.startNum-1}">
			                            <i class="bi bi-chevron-left"></i>
			                        </a>
			                    </li>
                    		</c:when>
                    
                	    </c:choose>
                    </c:if>
                    
                    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                  	  <c:choose>
                    	<c:when test="${empty productVO}">
		                    <li>
		                        <a href="./list?curPage=${i}">
		                            ${i}
		                        </a>
		                    </li>
                    	</c:when>
                    	
                    	<c:when test="${not empty productVO}">
		                    <li>
		                        <a href="./list?categoryNum=${productVO.categoryNum}&curPage=${i}">
		                            ${i}
		                        </a>
		                    </li>
                    	</c:when>
                    	
                    </c:choose>
                   </c:forEach>
                    
                 <c:if test="${pager.next}">
                 	<c:choose>
	                 	<c:when test="${empty productVO}">
		                    <li>
		                        <a href="./list?curPage=${pager.lastNum+1}">
		                            <i class="bi bi-chevron-right"></i>
		                        </a>
		                    </li>
		                </c:when>
		                
	                 	<c:when test="${not empty productVO}">
		                    <li>
		                        <a href="./list?categoryNum=${productVO.categoryNum}&curPage=${pager.lastNum+1}">
		                            <i class="bi bi-chevron-right"></i>
		                        </a>
		                    </li>
		                </c:when>
	                </c:choose>
  				</c:if>
   
   				
   
                </ul>
                
                
            </div>
          </div>
            
     </section>


     
 
       
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>

     </div>
     <script src="../js/main.js"></script>
     <script src="../js/second-header.js"></script>
     <script src="../js/cuttingLocation.js"></script>





     
 


    

</body>
</html>

