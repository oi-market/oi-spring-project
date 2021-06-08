<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내 상품 수정 페이지</h1>
	
	<div class="container px-4 px-lg-5 my-5">
	<div class="container">
		<form id="form" action="./productUpdate" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${param.num}">
                <div class="row gx-4 gx-lg-5 align-items-center">
                   		<div class="form-group">
                        	Title: <input type="text" id="title" name="title" value="${vo.title}">
                        <div class="form-group">
                        	Contents: <input type="text" id="contents" name="contents" value="${vo.contents}">
                        	Price: <input type="text" id="price" name="price" value="${vo.price}">
                        </div>
                        <div class="d-flex">
							<div class="button">
								 <input type="submit" id="btn" value="UPDATE" class="btn btn-primary">
							</div>
							<!-- 상품 상태 변경 (판매완료) -->
							<div class="button">
								<a href="./saleUpdate?num=${vo.num}" class="btn">판매완료</a>
							</div>
                        </div>              
                    </div>
                </div>
         </form>
     </div>
     </div>            		
	
</body>
</html>