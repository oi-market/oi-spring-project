<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../template/hm_import.jsp"></c:import>
<meta charset="UTF-8">
<title>아이디 찾기  오이마켓</title>

<meta name="author" content="wook">
<meta name="description" content="오이마켓">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 외부에 페이지 공유될때 노출,, 검색엔진에 노출 -->
<!-- open gragh http://ogp.me/-->
<meta property="og:type" content="website">
<meta property="og:site_name" content="오이마켓">
<meta property="og:title" content="second hand platform">
<meta property="og:description" content="중고, 중고거래, 오이마켓">
<meta property="og:image" content="img/logo__github.com">

<!--twitter card  -->
<meta property="twitter:card" content="summary">
<meta property="twitter:site" content="오이마켓">
<meta property="twitter:title" content="second hand platform">
<meta property="twitter:description" content="중고, 중고거래, 오이마켓">
<meta property="twitter:image" content="img/logo__github">
<meta property="twitter:url" content="summary">

<link rel="shortcut icon" type="image/x-icon" href="./favicon.ico">
<link rel="icon" href="./favicon.ico">
<link rel="apple-touch-icon" href="./favicon.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css"
	integrity="sha512-IJEbgDEF7OeKJRa0MY2PApnyJHRIsgzCveek4ec8VWQ+7KG3ZSKVNYa5xP/Gh0hVP0Mwb+gBsk+GwR3JQGhQNg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 먼저 호출되야함 reset! -->
<link rel="stylesheet" href="../css/mainScss.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/member.css">


</head>
<body>
	<div class="body__container">




		<header class="sign-in-head">
			<div class="inner clearfix">
				<div class="menu-group float--left">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/">oi</a>
					</div>
				</div>
			</div>
		</header>





		<!-- contents -->


		<section class="section sign-in">
			<div class="sign-in-body">
				<h1>아이디 찾기</h1>


				<!-- 안에 있는 인풋들은 짜논 코드 대로 변경해서 써주세요! -->



				<div class="inputs">
					<div id="id-input">
						<p>이름</p>

					</div>
					<input id="name" name="name" placeholder="이름"
						class="col-12 input--text">
					<div id="id-input">
						<p>전화번호</p>

					</div>
					<input id="phone" name="phone" placeholder="전화번호"
						class="col-12 input--text">
					<div id="id-input">
						<p>이메일</p>

					</div>
					<input id="email" name="email" placeholder="이메일"
						class="col-12 input--text">
				</div>


				<div class="d-grid">
					<input type="button" id=find_ID
						class="mybtn mybtn--primary mb-5 sign-up-btn" value="아이디 찾기">
				</div>



				



				<div class="anotherLogin">
					<p>
						<a href="${pageContext.request.contextPath}/member/sign-in">로그인
							하러가기</a>
					</p>
				</div>

			</div>




		</section>



	</div>


	<script type="text/javascript" src="../js/member.js"></script>
	
	<script  type="text/javascript">
	
	//아이디 찾기
 $("#find_ID").click(function () {
		 var name = $("#name").val();
		 var email = $("#email").val();
		 var phone = $("#phone").val();
		if (email == "" || name=="" || phone=="") {
			alert("정보를 입력해주시기 바랍니다.");
		}else{ $.ajax({
			type : 'POST',
			url : 'memberFindID',
			data : {
				email	:	email,
				name	:	name,
				phone	:	phone,
			},

			dataType :'text',
			
			success : function(data) {
				
				msg = data;
		        alert(msg);
		        message =$("message").val("principal.username");

		       
		        
		    }
			
	 })
		} 
		
	})
	</script>
</body>
</html>