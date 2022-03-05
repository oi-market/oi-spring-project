<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코멘트 업데이트|오이마켓</title>

</head>
<body>
		<h1>Comments Update</h1>
		<form id="form" action="./commentsUpdate" method="post">
	
			<div>

		        <input type="hidden" id="num" name="num" value="${param.num}" />
		        
		        <input type="text" id="writer" name="writer" 
		        placeholder="writer" value="${comments.writer}" />
		        <br>
		        
		        <input type="text" id="location" name="location" 
		        placeholder="location" value="${comments.location}" />
		        <br>
		        
		        <textarea id="contents" 
		        name="contents">${comments.contents}
		        </textarea>
		        
		        
		        <input type="submit" value="Update!" />
		        
			</div>
	
		</form>	
</body>

</html>