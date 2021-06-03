<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- 수정 및 삭제 버튼, 상품 이미지, 금액, 업로드 날짜, 판매여부, 판매 지역, 관심 수(보류) -->

	<!-- Product section-->   
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${vo.title}</h1>
                        <div class="fs-5 mb-5">
                        <p>${vo.contents}</p>
                            <span>price: ${vo.price}</span>
                        </div>
                        <div class="d-flex">
                        	<!-- 로그인한 username과 동일해야 수정 삭제 가능하도록 -->
							<div class="button">
								<a href="./productUpdate?num=${vo.num}" class="btn">상품 수정</a>
								<a href="./productDelete?num=${vo.num}" class="btn">상품 삭제</a>
							</div>
                        </div>              
                    </div>
                </div>
            </div>       
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
        
</body>
</html>