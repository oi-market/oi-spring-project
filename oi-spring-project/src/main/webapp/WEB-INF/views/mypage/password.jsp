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
    <title>비밀번호 변경  |오이마켓</title>

    <meta name="author" content="wook">
    <meta name="description" content="오이마켓">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, maximum-scale=1">
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
    <link rel="preconnect" href="https://fonts.gstatic.com"> 
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <!-- 먼저 호출되야함 reset! -->
    <link rel="stylesheet" href="../css/mainScss.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" integrity="sha512-IJEbgDEF7OeKJRa0MY2PApnyJHRIsgzCveek4ec8VWQ+7KG3ZSKVNYa5xP/Gh0hVP0Mwb+gBsk+GwR3JQGhQNg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/mypage.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <!-- jsp로 바꿀때 경로 신경쓰기 -->
  
</head>
<body>
     <div class="body__container">


       <!-- HEADER -->
 <c:import url="../template/header.jsp"></c:import>  
    
     <section class="section mypage">
         <div class="inner">
         <c:import url="../template/mypage-nav.jsp"></c:import>  
           

            <div class="content col-5">
                
                <div class="content-header">
                    <h1 class="page-name">비밀번호</h1>
                </div>
                
                

                <div class="account-body">
                    

                    <form method="post" action="#">

                        <div class="password__bundle">
                            <div class="password-inner-title">
                                <p class="red-star">*</p>
                                <label for="origin-password">현재 비밀번호</label>
                            </div>
                            <input id="origin-password" type="password"> </input>
                        </div>

                        <div class="password__bundle">
                            <div class="password-inner-title">
                                <p class="red-star">*</p>
                                <label for="new-password">바꿀 비밀번호</label>
                            </div>
                            <input id="new-password" type="password"> </input>
                        </div>

                        <div class="password__bundle">
                            <div class="password-inner-title">
                                <p class="red-star">*</p>
                                <label for="new-password-confirm">비밀번호 확인</label>
                            </div>
                            <input id="new-password-confirm" type="password"> </input>
                        </div>
                   
                        <input class="mybtn passwordBtn" type="button" onclick="passwordNewpw()" value="바꾸기"></input>
                    </form>
                    
                    
                </div>
                
                <div class="content-second-header">
                    <h1>계정 삭제</h1>
                </div>
                
                <form method="POST" action="#">
                    <div class="password-body delete-body">
                        <label for="deleteID">모든 정보가 삭제됩니다</label>
                        <input data-toggle="modal" data-target="#deleteID"  class="mybtn passwordBtn" type="button" value="계정 삭제"></input>
                    </div>
                </form>
            </div>
         </div>
     </section>

  <!-- The Modal -->
  <div class="modal fade" id="deleteID">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">계정 삭제</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <label>패스워드를 입력하시오</label><p>
         <input id="passwordCheck" name="password" type="password">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button type="button" class="btn btn-primary" onclick="usernameDelete()">계정삭제</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          
        </div>
        
      </div>
    </div>
  </div>
  
</div>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>


     <script src="../js/main.js"></script>
     <script src="../js/myPage.js"></script>
	<script type="text/javascript" src="../js/member.js"></script>

<script type="text/javascript">

function passwordNewpw(){
	var origin_password = $("#origin-password").val();
	var newPassword = $("#new-password").val();
	var newPassword_confirm = $("#new-password-confirm").val();
	
	var newPasswordTrim= $.trim(newPassword);
	if(confirm("정말 변경하시겠습니까?") == true){

		if(newPasswordTrim.length>17||newPasswordTrim.length<7||newPasswordTrim==null){
			alert( "패스워드는 8글자 이상 16글자 이하입니다.");
				
		}else
		
			
		$.ajax({
			type : 'POST',
			url : '../member/memberPWChange',
			data : {
				"password" : origin_password,
				"newPW1" : newPassword,
				"newPW2" : newPassword_confirm,
				
			},

			dataType :'text',
			
			success : function(data) {
		       
				alert(data);
				if(data=="비밀번호가 변경되었습니다. 다시 로그인해주세요."){
				location.href="../member/memberLogout"
				}
		    },
			
		    error:function(request, status, error){
		    	alert(error);
		    },

			

		});
		
	
	}else{
		return;
	}
	
		
}

</script>

</body>
</html>