<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html >
<head>
  <title>Bootstrap Example</title>
  <c:import url="../template/header.jsp"></c:import>
</head>
<body>


 <a href="${pageContext.request.contextPath}/member/memberLogin" type="button" class="btn btn-primary">로그인페이지</a>
<a href="${pageContext.request.contextPath}/member/memberJoinCheck" type="button" class="btn btn-primary">회원가입</a>
<a href="${pageContext.request.contextPath}/member/jusoAPI" type="button" class="btn btn-primary">실험용쥐</a>
<div>
<h1>

</h1>
</div>

</body>
</html>
