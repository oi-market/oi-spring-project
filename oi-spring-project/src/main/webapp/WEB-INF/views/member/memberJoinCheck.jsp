<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<c:import url="../template/header.jsp"></c:import>
</head>
<body>

<h1>약관동의 페이지</h1>

<div class="container">
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						value="1" name="c1" id="all">전체동의
					</label>
				</div>

	<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						value="1" name="c1" class="check">동의
					</label>
				</div>

  <div class="jumbotron">
    <h1>약관동의</h1>      
    <p>1.약관동의 하시겠습니까</p>
  </div>
  
  <div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						value="1" name="c1" class="check">동의
					</label>
				</div>

  <div class="jumbotron">
    <h1>약관동의</h1>      
    <p>2.약관동의 하시겠습니까</p>
  </div>
  
  <div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						value="1" name="c1" class="check">동의
					</label>
				</div>

  <div class="jumbotron">
    <h1>약관동의</h1>      
    <p>3.약관동의 하시겠습니까</p>
  </div>
  <button class="btn btn-primary" id="btn">JOIN</button>
  <a href="javascript:history.back();" class="btn btn-danger">취소</a>
</div>


<script type="text/javascript">
$("#all").click(function(){
	let check = $("#all").prop("checked");
	$(".check").prop("checked", check);
});

$(".check").click(function(){
	let result = true;
	
	$(".check").each(function(){
		if(!$(this).prop("checked")){
			result = false;
		}
	});
	
	$("#all").prop("checked", result);
	
});


$("#btn").click(function(){
	let result = $("#all").prop("checked");
	if(result){
		location.href="./memberJoin";
	}else {
		alert("약관에 동의");
	}
});
</script>
</body>
</html>
