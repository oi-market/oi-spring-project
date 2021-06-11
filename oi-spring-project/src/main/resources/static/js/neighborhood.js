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





  // Close the dropdown menu if the user clicks outside of it
  window.onclick = function(event) {
    if (!event.target.closest('.dropbtn')) {
      
      for (let i = 0; i < dropbtn.length; i++) {
        if (dropbtn[i].classList.contains('show')) {
          dropbtn[i].classList.remove('show');
        }
      }
    }
  }