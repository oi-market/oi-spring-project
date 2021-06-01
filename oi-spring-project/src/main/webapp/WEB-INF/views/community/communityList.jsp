<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.line{
		border: 1px solid black;
	}
</style>
</head>
<body>

	<h1>Community List</h1>
	
	<table class="line">	
	<tbody>
		<c:forEach items="${list}" var="vo" >
				<tr>
					<td>${vo.category}</td>
					<td><a href="./${commounitySelect}?num=${vo.num}">
					${vo.contents}
					</a></td>
					<td>${vo.writer}</td>
					<td>${vo.regDate}</td>
					<td>${vo.like}</td>
				</tr>
			</c:forEach>
	</tbody>
	</table>

</body>
</html>