<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
  <c:import url="../template/header.jsp"></c:import>
<style type="text/css">
#sample {
	/* display: none; */
}
</style>
</head>
<body>

	<div class="container">
		<h2>${board}form</h2>
		<form id="frm" action="./${board}Insert" method="post" enctype="multipart/form-data">
			
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control myCheck" id="title" name="title">
			</div>

			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea id="summernote" name="contents"></textarea>
			</div>
			
			<input type="submit" id="btn" value="WRITE" class="btn btn-primary">
					<a href="javascript:history.back();" class="btn btn-danger">취소</a>
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