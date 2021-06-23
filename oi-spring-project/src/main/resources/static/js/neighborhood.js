
//드롭다운 , 드롭다운시 회전 및 등장

const btn = document.querySelectorAll(".inner__dropdown");
let arrow = document.querySelectorAll(".inner__dropdown i");
let degrees=[0,0]
const dropbtn = document.querySelectorAll(".dropdown-content");


for(let i=0; i<btn.length;i++){

    btn[i].addEventListener('click',function(){
    
        dropbtn[i].classList.toggle("show");
        
        
    if(degrees[i]>=90){
        arrow[i].style.transform=`rotate(0)`
        degrees[i]=0
    }else{
    degrees[i]+=90;
    arrow[i].style.transform=`rotate(${degrees[i]}deg)`;
    }

})
}

const replyBtn = document.querySelectorAll(".comment--reply");
const reply = document.querySelectorAll(".comment-insert.comment-insert--reply");
  for(let i=0; i<replyBtn.length;i++){
      replyBtn[i].addEventListener('click',function(){
        reply[i].classList.toggle("show");
      })
  }

  // Close the dropdown menu if the user clicks outside of it
  window.onclick = function(event) {
    if (!event.target.closest('.dropbtn')) {
      
      for (let i = 0; i < dropbtn.length; i++) {
        if (dropbtn[i].classList.contains('show')) {
          dropbtn[i].classList.remove('show');

          if(degrees[i]>=90){
            arrow[i].style.transform=`rotate(0)`
            degrees[i]=0
        }else{
        degrees[i]+=90;
        arrow[i].style.transform=`rotate(${degrees[i]}deg)`;
        }


        }
      }
    }
  }


  // 반응형

  const toggleSmall=document.querySelectorAll('.toggle--small');
  const toggleBtnSmall=document.getElementById('toggle-btn--village');

  toggleBtnSmall.addEventListener('click',function(){
      toggleElementsSmall();
      
    
  });

  function toggleElementsSmall(){
    [].forEach.call(toggleSmall,function(toggle){
      toggle.classList.toggle('on');
    });
  }
  function offElementsSmall(){
    [].forEach.call(toggleSmall,function(toggle){
      toggle.classList.remove('on');
    });
  }

  window.addEventListener('resize',function(){
    if(window.innerWidth >580){
      offElementsSmall();
    }
  })

  $(document).ready(function() {
    $('#summernote').summernote({
      height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '우리동네에 관련된 질문이나 이야기를 써주세요',	//placeholder 설정
		  
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
			$("#summernote").summernote('insertImage', fileName, function ($image) {
			 
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