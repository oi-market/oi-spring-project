<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
  <c:import url="../template/header.jsp"></c:import>
  <style type="text/css">
	

#div_main {
	position:absolute;
	 left:50%;
	width: 30%;
	min-height:100px;
	margin-left: -15%;
	text-align: left;

}
	

#div_footer {
	width: 100%;
	height:10%;
	bottom:0;

}

#div_page{
		width:100%;
		min-height:700px;
	text-align: center;
}

	
</style>

</head>
<body>

	<div id="div_page" class="container mt-2">
<h1>회원가입페이지</h1>
<div id ="div_main">
<form:form modelAttribute="memberVO" id="frm" action="./memberJoin" method="post">
			<!-- ID -->
			<div class="form-group">
				<label for="username">아이디</label> <!-- path에 memberVO에 없는 것을 넣으면 오류남 -->
				<form:input class="form-control" id="username" path="username"
				aria-describedby="idHelp" />
				<h4 id=idResult></h4>
				<h4 id=idCheckResult></h4>
				<!-- ID 는 6글자 이상 -->
			</div>
			
			<!-- Password -->
			<div class="form-group">
				<label for="password">비밀번호</label> 
				<form:password class="form-control" id="password" path="password" />
				<h4 id="pwResult"></h4>
				<!-- PW는 8글자 이상 -->
			</div> 
			
				<!-- Password 확인 -->
		 	<div class="form-group">
				<label for="password1">비밀번호 재확인</label> 
				<form:password class="form-control pw1Result" id="password1" path="password1" />
				<form:errors path="password" class="form-control is-invalid"></form:errors>
				<!-- 2번째 비밀번호를 입력했을 때, 같으면 아무일 X, 다르면 값을 지우기 -->
				<!-- PW 두개는 일치 -->	
			</div>
			
			<!-- nickName -->
			<div class="form-group">
				<label for="nickName">닉네임</label> 
				<form:input class="form-control" id="nickName" path="nickName" />
				<form:errors path="nickName"></form:errors>
				<!-- 비어 있으면 X -->
			</div>
			
			<!-- Name -->
			<div class="form-group">
				<label for="name">이름</label> 
				<form:input class="form-control" id="name" path="name" />
				<form:errors path="name" cssClass="c1"></form:errors>
				<!-- 비어 있으면 X -->
			</div>
			
			
			<!-- Phone -->
			<div class="form-group">
				<label for="phone">휴대전화</label> 
				<form:input class="form-control" id="phone" path="phone" />
				<form:errors path="phone"></form:errors>
				<!-- 비어 있으면 X -->
			</div>
			
			
			<!-- Email -->
			<div class="form-group">
				<label for="email">이메일</label> 
				<form:input class="form-control" id="email" path="email" />
				<button id = "emailCheck" type="button" class="sendMail" onclick="sendMail()" style="border: 1px solid black;">인증번호받기</button>                               
				<form:errors path="email"></form:errors>
				<!-- 비어 있으면 X -->
			</div>
			<!-- Email 인증 -->
			<div class="form-group">
				<label for="emailNum">인증번호</label> 
				<input  id="CheckMail"  type="text"  >
  			
				<!-- 비어 있으면 X -->
			</div>
			<!-- 주소 -->

			<div class="form-group">
			<label for="location">주소입력</label><p>
 		  	<input  id="member_post"  type="text" placeholder="우편번호" readonly >
  			<button type="button" class="btn btn-default" onclick="findAddr()" style="border: 1px solid black;"><i class="fa fa-search" ></i> 주소 찾기</button>                               
			</div>
			<div class="form-group">
  			<input class="form-control" id="member_addr"  name="location"  type="text" placeholder="주소" readonly> <br>
  			<form:errors path="location"></form:errors>
			</div>
			
			
			<!-- 이 버튼은 submit이벤트가 내장되어있어 값을 비교하고 보내는것이 아닌 그냥 보내므로 null값이여도 보내서 exception발생시킴 -->
			<!-- <button type="submit" class="btn btn-primary" id="check">Submit</button> -->
						
			<!-- input type으로 만든 버튼은 form 내부/외부 둘 다 작동안함 -->
			<!-- <input type="button" value="JOIN" class="btn btn-primary">  -->
			
			<input type="submit" value="JOIN" id="btn" class="btn btn-primary">
			<!-- button -->
		</form:form>
		 </div>
</div>		
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	var address = data.address
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
</script>

<script type="text/javascript">

function sendMail(){
	var email = $("#email").val(); //사용자의 이메일 입력값.
	var test = email.indexOf("@");
	
	if (email == "") {
		alert("메일 주소가 입력되지 않았습니다.");
	}else if(test==-1){
		
		alert("메일 형식이 잘못되었습니다.");
	} 
	else {
		$.ajax({
			type : 'GET',
			url : 'CheckMail',
			data : {
				"mail" : email,
			},
			contentType: "application/json; charset=utf-8;",
			dataType :'json',

		});
		alert("인증번호가 전송되었습니다.") 
		isCertification=true; //추후 인증 여부를 알기위한 값
	}
		
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
		
		

</body>
</html>