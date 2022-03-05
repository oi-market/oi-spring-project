<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코멘트 답글|오이마켓</title>
</head>
<body>

	<h1>Comments Reply</h1>
	
	<form id="form" action="./commentsReply" method="post">
	
			<div>
				<input type="hidden" id="num" name="num" value="${param.num}" />
		        <input type="hidden" id="communityNum" name="communityNum" value="${param.communityNum}" />
		        
		        <input type="text" id="writer" name="writer" 
		        placeholder="writer" />
		        <br>
		        
		        <input type="text" id="location" name="location" 
		        placeholder="location"/>
		        <br>
		        
		        <textarea id="contents" name="contents">
		        </textarea>
		        
		        
		        <input type="submit" value="댓글달기!" />
		        
			</div>
	
	</form>	

</body>
</html>