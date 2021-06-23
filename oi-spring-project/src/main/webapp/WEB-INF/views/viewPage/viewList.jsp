<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   

<!DOCTYPE html>
<html >
<head>
  <title>Bootstrap Example</title>
  <c:import url="../template/hm_import.jsp"></c:import>
</head>
<body>


 <a href="${pageContext.request.contextPath}/member/memberLogin" type="button" class="btn btn-primary">로그인페이지</a>
<a href="${pageContext.request.contextPath}/member/memberLogout" type="button" class="btn btn-primary">로그아웃</a>
<a href="${pageContext.request.contextPath}/viewPage/viewProfile" type="button" class="btn btn-primary">여기서 시작</a>
<div>
<form action="viewProfile" method="get">
<input type="text" id="username"  name="username" >
<button type="submit" class="mybtn sign-in">이 아이디 검색</button>
</form>
</div>
<div class="container">
		<h1>
			<!-- 로그인 상태 또는 사용자가 익명사용자 -->
			<sec:authorize access="isAuthenticated()">
				로그인 성공 상태
				<sec:authentication property="principal.username"/>님 환영
			<sec:authentication property="principal.name"/>님 환영
			</sec:authorize>
			<!-- 로그인 하지 않은 상태 -->
			<sec:authorize access="!isAuthenticated()">
				로그인 하지 않은 상태
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				관리자
			</sec:authorize>
			
			
		</h1>
		</div>
		
		
		
		

</body>
</html>
