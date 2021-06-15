<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

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
    	width: 100%;
    	font-size: 10pt;
    	color: gray;
    }
    
    .div-left{
    	width: 50%;
    	float: left;
    }
    
    .div-right{
    	width: 50%;
    	float: right;
    }
    
    .insert-button{
    	border: 1px solid black;
    	width: 5%;
    	height: auto;
    	margin-left: 55%; 
    	margin-bottom: 5%;
    }
    
    /*말줄임 css*/
    .box {
	    display: -webkit-box;
	    height: 180px;/*줄일 높이?*/
	    word-wrap: break-word;
	    -webkit-line-clamp: 1;	/*보여주고싶은 줄 수*/
	    -webkit-box-orient: vertical;
	    text-overflow: ellipsis;
	    overflow: hidden;
	}
    
	
</style>

</head>
<body>

	<h1>Community List</h1>
	
	<c:forEach items="${list}" var="vo" >
		<div class="table-box">
			<ul>
				<li>
					<div class="category-line">
						${vo.category}
					</div>
				</li>
				
				<li class="box">
					<a href="./communitySelect?categoryNum=${vo.categoryNum}&&num=${vo.num}&&communityNum=${vo.num}">
					${vo.contents}
					</a>
				</li>
				<li>
					<div class="div-size">
						<div class="div-left">${vo.writer} · ${vo.location}</div>
						<div class="div-right">${vo.regDate}</div>
					</div>
				</li>
			</ul>
		</div>
	</c:forEach>

	<div class="insert-button">
		<a href="./communityInsert">글 작성</a>
	</div>
	
	
	<!-- 있어야 pageing 가능 : 원래 kind, search 부분 -->
	<div class="input-group mt-3 mb-3 first-size">
	  <form id="form" action="./communityList" class="form-inline">
		  <input type="hidden" name="curPage" value="1" id="curPage">
 	  </form> 
  	</div>
	
	
	<div class="second-size" style="margin-left:42%;">
		  <ul class="pagination">
		  
			  <c:if test="${communityPager.pre}">	
			    <li class="page-item"><a class="page-link pager" href="#" title="${communityPager.startNum-1}">Previous</a></li>
			  </c:if>
		   
		   	  <c:forEach begin="${communityPager.startNum}" end="${communityPager.lastNum}" var="i">
		   		<li class="page-item"><a class="page-link pager" href="#" title="${i}">${i}</a></li>
		   	  </c:forEach>
		   
		      <c:if test="${communityPager.next}">
		      	<li class="page-item"><a class="page-link pager" href="#" title="${communityPager.lastNum+1}">Next</a></li>
		      </c:if>
		      
		  </ul>
		  
		  <script type="text/javascript">
				
				$(".pager").click(function () {
					let curPage = $(this).attr("title");
					$("#curPage").val(curPage);
					$("#form").submit();
				
				});
			
			</script> 
	  </div>

</body> 
</html>