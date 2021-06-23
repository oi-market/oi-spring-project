<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- summernote -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>

	<h1>Community Insert</h1>
	
	<form id="form" action="./communityInsert" method="post" enctype="multipart/form-data">
	
		<div>
		
			<!-- 카테고리 선택 -->
	        <select name="categoryNum">
	            <option value="1" >같이해요</option>
	            <option value="2" >우리동네질문</option>
	            <option value="3" >해주세요</option>
	            <option value="4" >동네맛집</option>
	            <option value="5" >일상</option>
	            <option value="6" >기타</option>
	        </select>
	        
	        <hr>
	        											<!-- 세션에 로그인된 친구의 닉네임 -->
	        <!-- type="hidden" -->			<!-- value="${member.nicName}" -->
	        <input type="text" id="writer" name="writer" placeholder="writer">
	        <br>
	        
	        <input type="text" id="location" name="location" placeholder="location">
	        <br>
	        <textarea class="form-control myCheck" cols="30" rows="5" id="contents" name="contents">
	        </textarea>
	        
	        
	        <input type="submit" value="Go!" />
	        
		</div>
	
	</form>	

</body>

<script type="text/javascript" src="/jquery/summerFile.js"></script>
</html>