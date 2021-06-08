<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
    	width: 20%;
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
    	margin-left: 5%;
    	margin-bottom: 3%;
    }
    
    .input-box{
    	border: 1px solid black;
    	width: 95%;
    	margin-top:2%;
    	margin-left:2%;
    }

    
	
</style>


</head>
<body>
	<h1>Community Select</h1>
	
	<!-- 글 내용 -->
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
		
		<a class="insert-button" href="#">♡</a>
		<a class="insert-button" href="./communityUpdate?num=${vo.num}">글 수정</a>
		<a class="insert-button" href="./communityDelete?num=${vo.num}">글 삭제</a>
	
	</div>
	
	
	<!-- 댓글 -->
	<div class="table-box">
	
		<div class="input-box">
			<form id="form" action="../comments/commentsInsert?communityNum=${vo.num}" method="post">
				<ul>
					<li>
						<input type="hidden" id="communityNum" name="communityNum">
					</li>
					
					<li>
						<input type="text" id="writer" name="writer" placeholder="writer">
						<input type="text" id="location" name="location" placeholder="location">
						<input type="submit" value="작성!" />
					</li>
	
					<li>
						<textarea class="form-control myCheck" cols="30" rows="5" id="contents" name="contents">
		        		</textarea>
					</li>        
				</ul>
			</form>
		</div>
	
		<c:if test="${comments ne null}">
			<c:forEach items="${list}" var="comments">			
					<ul>					
						<li>			
							<div class="div-size">
								<div class="div-left">아이콘</div>
								<div class="div-right">
									${comments.writer}<br>
									${comments.location} · ${comments.regDate}
								</div>
								<a class="insert-button" href="../comments/commentsUpdate?num=${comments.num}">댓글 수정</a>
								<a class="insert-button" href="../comments/commentsDelete?num=${comments.num}">댓글 삭제</a>
								<a class="insert-button" href="#">답글</a>
							</div>
						</li>
						
						<li>${comments.contents}</li>					
					</ul>
			</c:forEach>
		</c:if>
			
	</div>
	
</body>

</html>