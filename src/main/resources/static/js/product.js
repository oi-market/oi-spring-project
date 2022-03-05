
let delBtn = document.getElementById('delBtn');
let delfrm = document.getElementById('delfrm');
let wishBtn = document.getElementById('wishBtn');
let wishFrm = document.getElementById('wishFrm');






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


wishBtn.addEventListener('click',function(){	
	let result = confirm('위시리스트에 추가하시겠습니까?');
		if(result==true){
			wishFrm.submit();
		}else{
			alert('추가하지 않았습니다.')
		}
});

	delBtn.addEventListener('click',function(){	
	let result = confirm('지우시겠습니까!');
		if(result==true){
			delfrm.submit();
		}else{
			alert('삭제하지 않습니다.')
		}
});



