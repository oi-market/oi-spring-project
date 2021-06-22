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
         <div class="inner inner--insert">

     
             <div class="product-insert__body product-select__body">



                    <div class="insert--title">상품 등록하기</div>

               

                    <div class="insert__body">

                        <div class="inner__title">
                            <p>상품 이미지</p>
                        </div>


                        <div class="photo-inner__body">
                            <div class="preview-images"  id="attachFileDiv" >
                                 <img class="preview" id="product-image-preview" src="../img/needImg.png"  alt="profile_image">
                            </div>
                            <input id="product-image-input" type="file" accept="image/*" onchange="loadImg(event,null)"> </input>
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
                            
                            <input type="text" class="input--text" placeholder="상품 제목을 입력해주세요">
                            
                        </div>
                        
                    </div>
                    <div class="insert__body">

                        <div class="inner__title">
                            <p>카테고리</p>
                        </div>


                        <div class="photo-inner__body">
                            
                            <select>
                                <option>디지털기기</option>
                                <option>생활가전</option>
                                <option>가구/인테리어</option>
                                <option>유아동</option>
                                <option>생활/가공식품</option>
                                <option>스포츠/레저</option>
                                <option>여성의류</option>
                                <option>남성의류</option>
                                <option>게임/취미</option>
                                <option>뷰티/미용</option>
                                <option>반려동물용품</option>
                                <option>도서/티켓/음반</option>
                            
                      

                            </select>
                            
                            
                        </div>
                        
                    </div>
                    <div class="insert__body">

                        <div class="inner__title">
                            <p>가격</p>
                        </div>


                        <div class="photo-inner__body photo-inner__body--amount">
                            
                           
                                <input id="amount-scale" type="text" class="input--text" placeholder="숫자만 적어주세요">
                                <span>원</span>
                            
                        </div>
                        
                    </div>
                    <div class="insert__body">

                        <div class="inner__title">
                            <p>설명</p> 
                        </div>


                        <div class="photo-inner__body photo-inner__body--description">
                            
                            <input type="text" class="input--text" placeholder="상품 설명을 입력해주세요">
                          

                        </div>
                        
                    </div>

                   
                        <button class="mybtn mybtn--primary regBtn">등록하기</button>
                    






                </div>



            

        </div>     
     </section>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>


     </div>
     <script src="../js/main.js"></script>
     <script src="../js/second-header.js"></script>
     <script src="../js/productInsert.js"></script>


</body>
</html>

