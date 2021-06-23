/**
 * 
 */
let loadImg  = function(event,n) {
 
    let reader = new FileReader();
    reader.onload = function(){
      let preImg = document.getElementById(`preview${n}`);
      preImg.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
};




attachFile = {
    idx:0,
    add:function(){ // 파일필드 추가
        
        let countInput = document.querySelectorAll('input[type="file"]');
        if(countInput.length<=3){
      
       
        var o = this;
        var idx = o.idx;

        var div = document.createElement('div');
        div.id = 'file' + o.idx;

        var file = document.createElement('input');
        file.type = 'file';
        file.name = 'files';
        file.id = 'fileField' + o.idx;
        file.setAttribute('onchange',`loadImg(event,${o.idx})`);
        // file.style.display = 'none';

        var btn = document.createElement('input');
        btn.type = 'button';
        btn.value = '삭제';
        btn.classList.add('mybtn');
        btn.onclick = function(){o.del(idx)}
        

        let img = document.createElement('img');
        img.classList.add('preview');
        img.id='preview'+o.idx;
        img.src='../img/needImg.png';

        let lableBtn =document.getElementById('label-button');
        lableBtn.setAttribute('for',`fileField${o.idx}`);
        
        div.appendChild(file);
        div.appendChild(btn);
        div.appendChild(img);
        document.getElementById('attachFileDiv').appendChild(div);
        o.idx++;

        if(document.getElementById('product-image-preview')){
            document.getElementById('attachFileDiv').removeChild(document.getElementById('product-image-preview'));
        }
    }else{
        alert("세장까지 입력 가능합니다.");
    }
 
    },
    del:function(idx){ // 파일필드 삭제
        if(document.getElementById('fileField' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
            return;
        }
        document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));

      
    }
}



//// 화폐단위 focus, change
let amount = document.getElementById('amount-scale');
amount.addEventListener('change',function(){
    
    amount.value= amount.value.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    
});
amount.addEventListener('focus',function(){
    amount.value= '';
});   


/*
let regBtn = document.getElementById('regBtn');
regBtn.addEventListener('click',function(){
	alert('전송연습');
console.log(document.getElementById('product-title-input').value);
console.log(document.getElementById('attachFileDiv').childNodes[2].childNodes[0].value);
console.log(document.getElementById('amount-scale').value);
console.log(document.getElementById('product-category-input').value);
console.log(document.getElementById('product-contents-input').value);
});
*/


//모든 input채워져야 넘어감
let insertFrm = document.getElementById('insertFrm');
let regBtn = document.getElementById('regBtn');
regBtn.addEventListener('click',function(){
	
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
		insertFrm.submit();
		alert("상품 생성 성공");
	}else{
		alert("항목들을 모두 채워주십시오");
	}
});


