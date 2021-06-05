<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	.table-box {
		border: 1px solid black;
		width: 30%;
		height: auto;
		margin-left: 30%;
		margin-bottom: 2%;
		padding: 0 0 1.8% 0;
		color: black;
		font-size: 12pt;
	}
	
	ul {
  		list-style:none;
    }
    
    li {
    	padding-top: 2.5%;
    }
    
    .category-line{
    	background-color: #e2e2e2;
    	border-radius: 5px 5px 5px 5px;
    	border: 1px solid #e2e2e2;
    	text-align: center;
    	width: 30%;
    	height: auto;
    	padding: 0.5%;
    	font-size: 8pt;
    }
    
    a:link { 
    	color: black; 
    	text-decoration: none;
    }
    
    .div-size{
    	border-bottom: 1px solid black;
    	width: 100%;
    	height: 30%;
    	font-size: 10pt;
    	color: gray;
    	float:left;
    	
    	padding-bottom: 1.5%;
    	margin: 0 0 2% 0;
    }
    
    .div-left{
    	border: 1px solid black;
    	width: 50px;
    	height: 50px;
    	float: left;
    	margin-right: 2%; 
    }
    
    .div-right{
    	width: 50%;
    	float: left;
    }
    
    .insert-button{
    	border: 1px solid black;
    	width: 5%;
    	height: auto;
    	margin-left: 55%; 
    	margin-bottom: 5%;
    }

    
	
</style>

</head>
<body>
	<h1>Community Select</h1>
	
	<div class="table-box">
		<ul>
			<li >
				<div class="category-line">
					${vo.category}
				</div>
			</li>
			
			<li>
				<div class="div-size">
					<div class="div-left">아이콘</div>
					<div class="div-right">
						${vo.writer}<br>
						${vo.location} · ${vo.regDate}
					</div>
				</div>
			</li>
			
			<li>${vo.contents}</li>
		</ul>
	</div>
	
	<div>
		<div class="insert-button">
			<a href="./communityUpdate?num=${vo.num}">글 수정</a>
		</div>
		
		<div class="insert-button">
			<a href="./communityDelete?num=${vo.num}">글 삭제</a>
		</div>
	</div>
	
</body>
</html>