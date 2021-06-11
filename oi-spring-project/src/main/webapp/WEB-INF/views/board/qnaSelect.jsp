<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/hm_import.jsp"></c:import>
</head>
<body>
<div class="container">


	<h1>${board} Select Page</h1>
	<h3>Title : ${vo.title}</h3>
	<h3>Contents : ${vo.contents}</h3>


	
	<a href="./${board}Update?num=${vo.num}" class="btn btn-primary">Update</a>
	<a href="./${board}Delete?num=${vo.num}" class="btn btn-link" onclick="if(!confirm('게시글을 삭제하시겠습니다?')){return false;}">Delete</a>
</div>


</body>
</html>