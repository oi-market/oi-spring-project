<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>index Page</h1>

<a href="${pageContext.request.contextPath}/member/memberPage">실험용쥐1</a>
<h1>맴버 아이디: ${member.username}</h1>

</body>
</html>