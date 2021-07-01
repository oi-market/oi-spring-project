<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 생활|오이마켓</title>

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
    <link rel="stylesheet" href="../css/neighborhood.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    <!-- jsp로 바꿀때 경로 신경쓰기 -->
    
    <!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style type="text/css">
	#star {
  display: flex;
}

.star {
  font-size: 2rem;
  margin: 10px 0;
  cursor: pointer;
}

.star:not(.on) {
  color: #ccc;
}

.star.on {
  color: orange;
}</style>
</head>
<body>

 	<!-- HEADER -->
    <c:import url="../template/header.jsp"></c:import>
	
	<h1>내 상품 수정 페이지</h1><br><br><br>

<div class="container">
	<form id="form" action="./reviewInsert" method="post">

			<sec:authorize access="isAuthenticated()">	
				<div class="form-group">
					<label for="writer"></label> 
					<input type="readonly" id="writer" name="writer" value="<sec:authentication property="principal.username"/>">
				</div>
			</sec:authorize>		
						
				<div class="form-group">
					<label for="writer">상품번호</label> 
					<input type="hidden" id="productNum" name="productNum" value="${vo.num}">
				</div>
				
				<div class="form-group">
					<label for="writer">받는사람</label> 
							<input type="text" id="reciver" name="reciver" value="${seller}">
				</div>
	
				<div class="form-group">
					<label for="contents">내용</label>
					<textarea class="form-control myCheck" rows="5" id="contents" name="contents"></textarea>
				</div>
				
				<div class="form-group">
				<div class="star-container" id="star">
					<label for="contents">별점</label>
  					<span class="star" name="score" title="1">★
  						<input type="hidden" id="score" name="score" value="1"> 
  					</span>
				    <span class="star" name="score" title="2">★</span>
				    <span class="star" name="score" title="3">★</span>
				    <span class="star" name="score" title="4">★</span>
				    <span class="star" name="score" title="5">★</span>
				</div> 
				</div>
				
				<div class="form-group">
					<label for="contents">position</label>
							<input type="text" id="writerPosition" name="writerPosition" value="buyer">					
				</div>
					
				
				<div class="button">
					<input type="submit" id="btn" value="등록" class="btn btn-primary">
				</div> <br><br><br><br><br><br>
			
	</form>
</div>

	<!-- FOOTER -->
    <c:import url="../template/footer.jsp"></c:import>

     <script src="../js/main.js"></script>    
    <!--  <script src="../js/neighborhood.js"></script>	 -->
     <script type="text/javascript">
     (function () {
    	    var starEls = document.querySelectorAll('#star span.star');
    	    var rate = 0;

    	    loop(starEls, function (el, index) {
    	        el.addEventListener('click', function () {
    	            rating(index + 1);
    	        });
    	    });

    	    function loop(list, func) {
    	        Array.prototype.forEach.call(list, func);
    	    }

    	    function rating(score) {
    	        loop(starEls, function (el, index) {
    	            if (index < score) {
    	                el.classList.add('on');
    	            } else {
    	                el.classList.remove('on');
    	            }
    	        });

    	        rate = score;
    	        
    	        //alert(score);
    	        $("#score").val(score);
    	        
    	    }
    	})();
     </script>
</body>
</html>