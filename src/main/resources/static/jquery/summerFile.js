/**
 * 
 */

$("#contents").summernote({
			height:500,
			placeholder: '내용을 작성해주세요!',
			callbacks: {
				onImageUpload: function(files) {
				   // upload image to server and create imgNode...
				   //$summernote.summernote('insertNode', imgNode);
				   uploadFile(files);
				   
				 }, // -- onImageUpload
				onMediaDelete: function(files){
					deleteFile(files);
				}
					
			}// -- callbacks
});

function deleteFile(files){
	let fileName = $(files[0]).attr("src");
	fileName = fileName.substring(fileName.lastIndexOf('/')+1);
	$.post("summerFileDelete", {fileName:fileName}, function(result){
		console.log(result);
	});
}


function uploadFile(files) {
	const formData = new FormData();//Form 태그 생성
	formData.append('file', files[0]); //input type="file" name="file"
	let fileName="";
	$.ajax({
		type: "POST",
		url: "./summerFileUpload",
		data:formData,
		enctype:"multipart/form-data",
		cache:false,
		processData:false,
		contentType:false,
		success:function(result){
			fileName=result.trim();
			console.log(fileName);
			$("#contents").summernote('insertImage', fileName, function ($image) {
			 
			 console.log($image.width());
			 //이미지 사이즈에 따라 크기 바뀌어서 나오도록
			  if($image.width()>300){
			  	$image.css('width', $image.width() / 2);
			  }
			  
			  if($image.width()>800){
			  	$image.css('width', $image.width() / 3);
			  }
			
			  $image.css('width', $image.width());
			  $image.attr('data-filename', 'retriever');
			});
		} 
		
	})
};


