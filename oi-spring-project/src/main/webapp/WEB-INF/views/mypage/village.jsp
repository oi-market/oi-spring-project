<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
         <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지 |오이마켓</title>

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
           

            <div class="content">
                
                <div class="content-header">
                    <h1 class="page-name">내 동네 설정</h1>
                </div>
                
               <div class="content-description">
                    

                <div class="content-body">
                    <div class="title-underline">
                        <p>
                            지금 내 동네
                        </p>
                    </div>
                    <div class="on-sale">

                       
                        <div>
                             <sec:authentication property="principal.location"/>
                        </div>
                       
                  
                    </div>
                    
                    
                    <div class="title-underline">
                        <p>
                            현재 위치 근처 물건 보기
                        </p>
                    </div>
                    <div class="on-sale">

                       
                        <div>
                        
								<form action="../member/radiusUpdate" method="post">
                        		<p>현재 거리 :   <sec:authentication property="principal.radius"/>KM </p>
								<select name="radius" id="radius--input">
									<option value="10">10KM</option>
									<option value="30">30KM</option>
									<option value="50" selected="selected">50KM</option>
									<option value="70">70KM</option>
								</select>      
								<button type="submit">거리 설정</button>                      
								</form>

                        </div>
                       
                  
                    </div>
                    
                    
                    <div class="title-underline">
                        <p>
                            동네 변경
                        </p>
                    </div>
                    <!-- 반복문으로 최대 3개만 불러오기 -->
                    <div class="on-sale">

                       
                      
						
						<form action="../member/loacationUpdate" method="post" id="addressUpdateFrm">
                       

	
                        <input id="member_post" type="hidden" placeholder="우편번호" readonly class="col-12 input--text">
						<input class="form-control" id="member_addr" name="location" type="text" placeholder="주소" readonly>
						<input class="input--text" type="hidden" id="wgs84X" name="wgs84X">
			    		<input class="input--text" type="hidden" id="wgs84Y" name="wgs84Y">
                        <button type="button" class="btn btn-default mybtn findAdress sign-in" onclick="findAddr()"
							style="border: 1px solid black;">

							<i class="fa fa-search"></i> 주소 찾기
						</button>
                    	<input type="submit" class="mybtn" value="주소 바꾸기">
                       </form>
        
                    </div>
                    
                </div>
                </div>
                
            </div>
            
         </div>
     </section>


     
 
        <!-- FOOTER -->
        <c:import url="../template/footer.jsp"></c:import>

     </div>
     <script src="../js/main.js"></script>
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d58b4a3149fa76e3f33c4a03c9252a9d&libraries=services"></script>
     <script src="../js/myPage.js"></script>



</body>
</html>

