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