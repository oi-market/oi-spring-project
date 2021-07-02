<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 수정|오이마켓</title>

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
         <div class="inner inner--insert">

     
             <div class="product-insert__body product-select__body">




			         <c:forEach items="${vo.productFiles}" var="file" varStatus="status">
						<form action="./fileDelete" method="post" class="fileDeletFrm">
	              			<input type="hidden" value="${file.fileNum}" name="fileNum">
						</form>
					</c:forEach>







				<form action="./update?num=${vo.num}" id="updateFrm" method="post" enctype="multipart/form-data">


                    <div class="insert--title">상품 수정하기</div>

               

                    <div class="insert__body">

                        <div class="inner__title">
                            <p>상품 이미지</p>
                        </div>


                        <div class="photo-inner__body">
                            <div class="preview-images"  id="attachFileDiv" >   
                                 <c:forEach items="${vo.productFiles}" var="file" varStatus="status">               	
		                           	<div id="file${status.index+1000}">
		                           			<!-- 자바스크립트에서 input[type="file"] 3개 이상일 시 더 못만들게 하기 위해 생성한 input  -->  
	                                 	<input type="file" id="fileField${status.index+1000}" accept="image/*">	                                	
										<input type="button" value="삭제" class="mybtn fileDelBtn">         		                               
		                                <img class="preview" id="preview${status.index+1000}" src="../resources/upload/images${file.thumbnail}" alt="상품 이미지">
		                               <%--  <p>${vo.productFiles}</p> --%>
		                            </div>
		                            
                        		</c:forEach>
                                 
                                 
                               
                                 
                                 
                            </div>
                            <input id="product-image-input" type="file" accept="image/*" onchange="loadImg(event,null)">
                            <label id='label-button' for="product-image-input" onclick="attachFile.add()">업로드</label>
                            <p>* 상품 이미지는 640x640에 최적화 되어 있습니다.</p>
                            <p>- 이미지는 3장까지 등록 가능합니다.</p>
                            <p>- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.</p>
                        </div>
                        
                    </div>
                    <div class="insert__body">

                        <div class="inner__title">
                            <p>제목</p>
                        </div>


                        <div class="photo-inner__body">
                            
                            <input name="title" id="product-title-input" type="text" class="input--text" placeholder="상품 제목을 입력해주세요" value="${vo.title}">
                            
                        </div>
                        
                    </div>
                    <div class="insert__body">

                        <div class="inner__title">
                            <p>카테고리</p>
                        </div>


                        <div class="photo-inner__body">
                            
                            <select name="categoryNum" id="product-category-input" title="${vo.categoryNum}">
                                <option value="1">디지털기기</option>
                                <option value="2">생활가전</option>
                                <option value="3">가구/인테리어</option>
                                <option value="4">유아동</option>
                                <option value="5">생활/가공식품</option>
                                <option value="6">스포츠/레저</option>
                                <option value="7">여성의류</option>
                                <option value="8">남성의류</option>
                                <option value="9">게임/취미</option>
                                <option value="10">뷰티/미용</option>
                                <option value="11">반려동물용품</option>
                                <option value="12">도서/티켓/음반</option>
                     
                            </select>
                            
                            
                        </div>
                        
                    </div>
                    <div class="insert__body">

                        <div class="inner__title">
                            <p>가격</p>
                        </div>


                        <div class="photo-inner__body photo-inner__body--amount">
                            
                           
                                <input name="price" id="amount-scale" type="text" class="input--text" placeholder="숫자만 적어주세요"  value="${vo.price}">
                                <span>원</span>
                            
                        </div>
                        
                    </div>
                    <div class="insert__body">

                        <div class="inner__title">
                            <p>설명</p> 
                        </div>


                        <div class="photo-inner__body photo-inner__body--description">
                            
                            <input name="contents" id="product-contents-input" type="text" class="input--text" placeholder="상품 설명을 입력해주세요"  value="${vo.contents}">
                          

                        </div>
                        
                    </div>


						<input type="hidden" name="username" value=<sec:authentication property="principal.username"/>>
						<input type="hidden" name="location" value=<sec:authentication property="principal.location"/>>
						<input type="hidden" name="wgs84X" value=<sec:authentication property="principal.wgs84X"/>>
						<input type="hidden" name="wgs84Y" value=<sec:authentication property="principal.wgs84Y"/>>
					
						

                   
                        <button type="button" class="mybtn mybtn--primary regBtn" id=updateBtn>등록하기</button>
                    

							<%-- 		
                   <button class="mybtn" id="updateBtn">상품 수정</button>
               <form action="./update?num=${vo.num}" id="updateFrm" method="post">
				<input type="hidden" name="num" value="${vo.num}">
			</form>
			
			 --%>



					</form>



                </div>



            

        </div>     
     </section>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>


     </div>
     <script src="../js/main.js"></script>
     <script src="../js/second-header.js"></script>
     <script src="../js/productInsert.js"></script>
     <script src="../js/productUpdate.js"></script>


</body>
</html>

