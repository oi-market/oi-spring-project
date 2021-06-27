
//카테고리 - 선택한 카테고리로 설정
let categorySelect = document.getElementById('product-category-input');
    categorySelect[categorySelect.getAttribute('title')-1].selected = true;
 



//파일 개별 삭제
let fileDelButtons = document.querySelectorAll('.fileDelBtn');
let fileDelFrm = document.querySelectorAll('.fileDeletFrm');

for(let i=0;i<fileDelButtons.length;i++){
	fileDelButtons[i].addEventListener('click',function(){
		//if input-file 개수1개면 못 지우게 바꿔야함
		 let countInput = document.querySelectorAll('input[type="file"]');
        if(countInput.length>=3){
		alert(countInput.length);
		fileDelFrm[i].submit();
		}else{
			alert(countInput.length);
			alert('사진은 한장 이상 삽입해야합니다!')
		}
		
		
	});
}


let updateBtn = document.getElementById('updateBtn');
let updateFrm = document.getElementById('updateFrm');


updateBtn.addEventListener('click',function(){
	updateFrm.submit();
});


