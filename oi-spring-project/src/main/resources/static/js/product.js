
let delBtn = document.getElementById('delBtn');
let delfrm = document.getElementById('delfrm');

delBtn.addEventListener('click',function(){
	
	
	let result = confirm('지우시겠습니까!');
		

		if(result==true){
			delfrm.submit();
		}else{
			alert('삭제하지 않습니다.')
		}
		
});


let updateBtn = document.getElementById('updateBtn');
let updateFrm = document.getElementById('updateFrm');




let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName('mySlides');
  let dots = document.getElementsByClassName('dot');
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = 'none';  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(' active', '');
  }
  slides[slideIndex-1].style.display = 'block';  
  dots[slideIndex-1].className += ' active';
}





updateBtn.addEventListener('click',function(){
	
	if(!document.getElementById('attachFileDiv').childNodes[2]){
		alert('사진을 넣어주세요!');
	}
	if(!document.getElementById('attachFileDiv').childNodes[2].childNodes[0]){
		alert('사진을 넣어주세요!');
	}
	
	if(	
		(document.getElementById('product-title-input').value!="")&&
		(document.getElementById('attachFileDiv').childNodes[2].childNodes[0].value!="")&&
		(document.getElementById('amount-scale').value!="")&&
		(document.getElementById('product-category-input').value!="")&&
		(document.getElementById('product-contents-input').value!="")
		
	){
		updateFrm.submit();
		alert("상품 생성 성공");
	}else{
		alert("항목들을 모두 채워주십시오");
	}
});