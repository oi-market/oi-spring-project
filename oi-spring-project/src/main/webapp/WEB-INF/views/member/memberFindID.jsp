<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<style type="text/css">
#div_footer {
	width: 100%;
	height: 10%;
	bottom: 0px;
}

#div_main {
	width: 100%;
	height: 90%;
	text-align: center;
}

#div_page {
	width: 100%;
	height: 700px;
}
</style>
</head>
<body>
	<div id="div_page">
		<div id="div_main">
			<h3>&nbsp;</h3>
			<h1>&nbsp;</h1>
			<h1>&nbsp;</h1>
			<h1>아이디 찾기</h1>



			<div class="form-group">
				<input type="text" class="form-control etc" id="name" name="name"
					placeholder="이름을 입력하시오"
					style="width: 300px; height: 50px; margin: 0 auto;">

			</div>

			<div class="form-group">
				<input type="text" class="form-control etc" id="email" name="email"
					placeholder="이메일을 입력하시오"
					style="width: 300px; height: 50px; margin: 0 auto;">
			</div>

			<input type="button" id="find_ID" value="아이디 찾기"
				class="btn btn-primary">
				<a href="javascript:history.back();" class="btn btn-danger">취소</a>

		</div>
	</div>


		
 
	<script type="text/javascript">
	//var= msg;
	
	 
	 $("#find_ID").click(function () {
		 var name = $("#name").val();
		 var email = $("#email").val();
		if (email == "" || name=="" ) {
			alert("정보를 입력해주시기 바랍니다.");
		}else{ $.ajax({
			type : 'POST',
			url : 'memberFindID',
			data : {
				email	:	email,
				name	:	name,
			},

			dataType :'text',
			
			success : function(data) {
				
				msg = data;
		        alert(msg);
		        message =$("message").val("principal.username");
//		        $("#showID").modal("show");
		       
		        
		    }
			
	 })
		} 
		
	})
	
	
	 
	
	
	</script>

</body>
</html>