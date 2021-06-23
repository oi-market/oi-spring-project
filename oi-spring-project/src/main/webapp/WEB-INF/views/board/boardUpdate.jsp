<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/hm_import.jsp"></c:import>

</head>
<body>
 
 <div class="container">
 <h2>${board} Update form</h2>
  <form id="frm" action="./${board}Update" method="post">
  	<input type="hidden" name="num" value="${param.num}">
    
    <div class="form-group">
      <label for="title">Title:</label>
      <input type="text" class="form-control" id="title" name="title" value="${vo.title}">
    </div>
    
    <div class="form-group" style="line-height:0.5;">
				<label for="contents">Contents:</label>
				<textarea id="summernote" name="contents">${vo.contents}</textarea>
			</div>
    
    <input type="submit" id="btn" value="UPDATE" class="btn btn-primary">
  </form>
</div>


<script type="text/javascript">


$(function() {
  $('#summernote').summernote({
    height: 300,
    lang: 'ko-KR' // 언어 세팅
  });
});

</script>



<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> 
 <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</body>
</html>