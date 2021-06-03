<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>My Page</title>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/listStyle.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> 
		<span class="d-block d-lg-none"></span> 
		<span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="../resources/img/profile.jpg" alt="..." /></span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">판매내역</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">구매내역</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">관심목록</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#skills">로그인</a></li>
			</ul>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container-fluid p-0">

		<!-- 첫번째 section -->
		<section class="resume-section" id="about">
			<div class="resume-section-content">
				<h3>판매내역</h3>				
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   <c:forEach items="${list}" var="vo">
                    <div class="col mb-5">                 
                        <div class="card h-100">
                           <!-- 판매 완료된 상품 위에 표시 -->
                            <c:if test="${vo.sale eq 1}">
                           		<div class="badge bg-dark text-white position-absolute" style="top:0.5rem; right:0.5rem">판매완료</div>
                            </c:if>
                            <!-- 상품 이미지 -->
                            <a href="./productSelect?num=${vo.num}">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /></a>
                           	 <div class="card-body p-4">
                               	 <div class="text-center">
                                  	  <!-- 상품명 -->
                                  	  <h5 class="fw-bolder">${vo.title}</h5>
                                  	  <!-- 상품 가격 -->
                                      ${vo.price}
                               	 </div>
                            	</div>
                       	 </div>   
                    </div>
                   </c:forEach>                         
			</div>
		</div>
		</div>
		</section>
		<hr class="m-0" />

		<!-- 두번째 section-->
		<section class="resume-section" id="experience">
			<div class="resume-section-content">
				<h3>구매내역</h3>
				 <div class="container px-4 px-lg-5 mt-5">
                	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   	<c:forEach items="${order}" var="vo">
                    <div class="col mb-5">                 
                        <div class="card h-100">
                            <!-- 상품 이미지 -->
                            <a href="./productSelect?num=${vo.num}">
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /></a>
                           	 <div class="card-body p-4">
                               	 <div class="text-center">
                                  	  <!-- 상품명 -->
                                  	  <h5 class="fw-bolder">${vo.title}</h5>
                                  	  <!-- 상품 가격 -->
                                    ${vo.price}
                               	 </div>
                            	</div>
                       	 </div>   
                    </div>
                   	</c:forEach>                         
					</div>
				</div>
			</div>
		</section>
		<hr class="m-0" />

		<!-- 세번째 section-->
		<section class="resume-section" id="education">
			<div class="resume-section-content">
				<h3>관심목록</h3>
			</div>
		</section>
		<hr class="m-0" />

		<!-- 네번째 section-->
		<section class="resume-section" id="skills">
			<div class="resume-section-content">
				<h3>로그인</h3>
			</div>
		</section>
		<hr class="m-0" />

	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>