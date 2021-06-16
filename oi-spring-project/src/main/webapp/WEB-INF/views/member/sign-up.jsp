<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../template/hm_import.jsp"></c:import>
<meta charset="UTF-8">
<title>회원가입| 오이마켓</title>

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

<style type="text/css">
.r1 {
	border: 1px solid red;
}

.r2{

	border: 1px solid blue;
}

</style>

</head>
<body>
	<div class="body__container">




		<header class="sign-up-head">
			<div class="inner clearfix">
				<div class="menu-group float--left">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/">oi</a>
					</div>
				</div>
			</div>
		</header>





		<!-- contents -->


		<section class="sign-up-body">
			<div class="inner">


				<h1>계정 만들기</h1>
				<div class="d-grid col-12 col-md-12">
					<button class="btn btn-primary">소셜로그인</button>
					<button class="btn btn-secondary">일단 넣어놈</button>
					<button class="btn btn-dark">삭제 가능</button>
				</div>








				<form:form modelAttribute="memberVO" id="joinForm"
					action="./memberJoin" method="post">

					<div class="inputs" style="text-align: left;">
						<div>아이디(6글자 이상 12글자 이하입니다)</div>
						<form:input id="username" path="username" placeholder="아이디"
							class="col-12 input--text" aria-describedby="idHelp" />
						<button type="button" class="mybtn sign-in" onclick="idCheck()"
							style="border: 1px solid black; margin-top: 7px; margin-bottom: 10px;">중복확인</button>
						<div>비밀번호(8글자 이상 16글자 이하입니다)</div>
						<form:password path="password" placeholder="비밀번호"
							class="col-12 input--text" />
						<form:errors path="password" cssClass="c1"></form:errors>
						<h6 id="pwResult"></h6>

						<div>비밀번호 확인</div>
						<form:password placeholder="비밀번호 확인" class="col-12 input--text"
							id="password1" path="password1" />
						<h6 id="pwResult2"></h6>

						<div>이름</div>
						<form:input id="name" path="name" placeholder="이름"
							class="col-12 input--text" />
						<form:errors path="name" cssClass="c1"></form:errors>

						<div>별명</div>
						<form:input id="nickName" path="nickName" placeholder="별명"
							class="col-12 input--text" />
						<form:errors path="nickName"></form:errors>

						<div>전화번호</div>
						<form:input id="phone" path="phone" placeholder="전화번호"
							class="col-12 input--text" />
						<form:errors path="phone"></form:errors>


						<div>이메일</div>
						<form:input id="email" path="email" placeholder="이메일"
							class="col-12 input--text" />
						<button id="CheckMail" type="button" class="mybtn sign-in"
							onclick="sendMail()"
							style="border: 1px solid black; margin-top: 7px; margin-bottom: 10px;">인증번호받기</button>
						<form:errors path="email"></form:errors>

						<div>인증번호</div>
						<form:input id="emailNum" path="emailNum" placeholder="인증번호"
							class="col-12 input--text" />
						<button type="button" class="mybtn sign-in" onclick="emailCheck()"
							style="border: 1px solid black; margin-top: 7px; margin-bottom: 10px;">인증확인</button>
						<form:errors path="emailNum"></form:errors>

						<div>위치</div>
						<input id="member_post" type="text" placeholder="우편번호" readonly
							class="col-12 input--text">
						<button type="button" class="mybtn sign-in" onclick="findAddr()"
							style="border: 1px solid black; margin-top: 7px; margin-bottom: 10px;">
							<i class="fa fa-search"></i> 주소 찾기
						</button>


						<input class="form-control" id="member_addr" name="location"
							type="text" placeholder="주소" readonly> <br>
						<form:errors path="location"></form:errors>




					</div>

					<div class="agrees">
						<label class="checkbox-inline"> <input type="checkbox"
							value="option1" id="mainCheck"> <a href="#List1"
							data-toggle="modal">이용약관</a> 및 <a href="#List2"
							data-toggle="modal">개인정보 처리 방침</a>에 동의
						</label>
					</div>



					<div class="buttons d-grid">
						<!-- 비활성화 된 버튼 -->
						<input type="button" class="btn mybtn mybtn--primary "
							id="join_btn" value="계정 만들기">
						<!--  활성화 된 버튼  -->
						<!-- <input type="button" class="mybtn mybtn--primary" value="계정 만들기"> -->
					</div>

				</form:form>

				<div class="anotherLogin">
					<p>
						이미 회원이신가요? <a
							href="${pageContext.request.contextPath}/member/sign-in">로그인하기</a>
					</p>
				</div>



			</div>
		</section>



	</div>

	<!-- 이용약관 modal -->
	<div class="modal fade" id="List1">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h6 class="modal-title">이용약관</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<h6>
						<spring:message code="signCheck1"></spring:message>
					</h6>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<div class="modal fade" id="List2">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h6 class="modal-title">개인정보 처리 방침</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body"
					style="overflow-x: hidden; width: 490px; height: 150px;">
					<h6>
						<spring:message code="signCheck2"></spring:message>
					</h6>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>





	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="../js/member.js"></script>





</body>
</html>