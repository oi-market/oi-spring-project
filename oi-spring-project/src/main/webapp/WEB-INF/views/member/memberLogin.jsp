<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <c:import url="../template/header.jsp"></c:import>
</head>
<body>

<div class="container">
  <h2>로그인페이지</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    login
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">oi market</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<h1 style="	text-align: center;">Login</h1>
          <div class="form-group">
				<input type="text" class="form-control" placeholder="아이디를 입력하시오."
					id="id" name="id" style="width: 300px; height:50px; margin: 0 auto; ">
			</div>
			<div class="form-group">
				<input type="password" class="form-control"
					placeholder="비밀번호를 입력하시오." id="pw" name="pw"
					style="width: 300px; height:50px; margin: 0 auto">
			</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button type="submit" class="btn btn-primary">Login</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
<a href="${pageContext.request.contextPath}/member/memberJoinCheck" type="button" class="btn btn-primary">회원가입</a>
</body>
</html>
