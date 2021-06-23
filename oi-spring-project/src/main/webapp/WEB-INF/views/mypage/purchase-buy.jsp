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


      
	<c:import url="../template/header.jsp"></c:import>  

    
     <section class="section mypage">
         <div class="inner">

            <c:import url="../template/mypage-nav.jsp"></c:import>

            <div class="content">
                
                <div class="content-header">
                    <h1 class="page-name">상품</h1>
                </div>
                
                <div class="content-description">
                    <nav class="kinds-deal">                    
                        <ul>
                            <li class="sell">
                               <a href="${pageContext.request.contextPath}/mypage/purchase-sell">
                                    <i class="bi bi-file-earmark-medical">
                                    </i>
                                    <div>판매내역</div>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/mypage/purchase-buy">
                                    <i class="bi bi-cart-check-fill"></i>
                        
                                    <div>구매내역</div>
                                </a>
                            </li>
                            <li>
                              <a href="${pageContext.request.contextPath}/mypage/purchase-wish">
                                    <i class="bi bi-suit-heart"></i>
                                    <div>관심목록</div>
                                </a>
                            </li>
                        </ul>
                    </nav>

                </div>

                <div class="content-body">


                    <div class="title-underline">
                        <p>
                            구매내역
                        </p>
                    </div>
                    <div class="on-sale">

                       <c:forEach var="vo" items="${order}" varStatus="true"> 
                      <div class="product">

                            <div>
                                 <a href="./productSelect?num=${vo.num}">사진</a>
                            </div>

                            <div class="product-description">
                                <p class="review-name">${vo.title}</p>
                                <p class="review-location">${vo.location} · ${vo.regDate}</p>
                                <p>${vo.price}</p>
                            </div>

                            <div class="inner__dropdown">

                                <button type="button" class="dropdown">
                                    <i class="bi bi-three-dots"></i>
                                </button>

                                <div id="on-sale-dropdown" class="dropdown-content">
                                	<a href="./reviewInsert?num=${vo.num}">리뷰 작성</a>
                                    <a href="./productDelete?num=${vo.num}">삭제</a> 
                                </div>

                            </div>
						
                        </div>
                        </c:forEach>
                                              
                        <!-- end of product block -->
                    </div>        
                    <!-- end of content-body -->
                </div>
                
                <!-- 페이징 처리     
                <div class="pager">
                	<c:if test="${pager.pre}">
						<li class=linePage><a href="./purchase-buy?curPage=${pager.startNum-1}">PREV</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="p">
						<li class=linePage><a href="./purchase-buy?curPage=${p}">${p}</a></li>
					</c:forEach>
					<c:if test="${pager.next}">
						<li class=linePage><a href="./purchase-buy?curPage=${pager.lastNum+1}">NEXT</a></li>
					</c:if>  
				</div>  -->    
				       
                <!-- end of content -->
            </div> 
            
         </div>
     </section>


        <!-- FOOTER -->
       <c:import url="../template/footer.jsp"></c:import>

     </div>
     <script src="../js/main.js"></script>
     <script src="../js/myPage.js"></script>
     <script type="text/javascript">
 
     //상품 옆 (...)메뉴 드롭다운

     const btn = document.querySelectorAll(".inner__dropdown");
     const dropbtn = document.querySelectorAll(".dropdown-content");


     for(let i=0; i<btn.length;i++){

         btn[i].addEventListener('click',function(){
           // dropbtn[i].classList.toggle("show");
           dropbtn[i].classList.add("show");
         })
     }


     window.onclick = function(event) {
       if (!event.target.closest('.dropdown')) {
         
         for (let i = 0; i < dropbtn.length; i++) {
           if (dropbtn[i].classList.contains('show')) {
             dropbtn[i].classList.remove('show');

           }
         }
       }
     }


     </script>


</body>
</html>

