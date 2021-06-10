
// 왼쪽 네비바 옮겨가는 페이지마다 색깔 변경 

function sidebarStyle(li){
    li.style.background= "rgb(243, 243, 243)";
    li.style.border= "3px solid";
}

let pageName = document.querySelector(".page-name");
pageName=pageName.innerHTML;


if(pageName=='프로필'){   
    let li = document.querySelector(".sidebar-menu li:nth-child(1)");
    sidebarStyle(li)
}
if(pageName=='상품'){   
    let li = document.querySelector(".sidebar-menu li:nth-child(2)");
    sidebarStyle(li)
}
if(pageName=='후기'){   
    let li = document.querySelector(".sidebar-menu li:nth-child(3)");
    sidebarStyle(li)
}
if(pageName=='내 동네 설정'){   
    let li = document.querySelector(".sidebar-menu li:nth-child(4)");
    sidebarStyle(li)
}
if(pageName=='동네생활 글'){   
    let li = document.querySelector(".sidebar-menu li:nth-child(5)");
    sidebarStyle(li)
}
if(pageName=='동네생활 댓글'){   
    let li = document.querySelector(".sidebar-menu li:nth-child(6)");
    sidebarStyle(li)
}
if(pageName=='계정 관리'){   
    let li = document.querySelector(".sidebar-menu li:nth-child(7)");
    sidebarStyle(li)
}
if(pageName=='비밀번호'){   
    let li = document.querySelector(".sidebar-menu li:nth-child(8)");
    sidebarStyle(li)
}




//상품 옆 (...)메뉴 드롭다운


	
	
	function dropdownFunction(n) {
	let togleBtn = document.getElementsByClassName("dropdown-content");
	    togleBtn[n].classList.toggle('show');

	}
	function soldoutDropdownFunction(n){
		let togleBtn = document.getElementsByClassName("soldout-dropdown-content");
	    togleBtn[n].classList.toggle('show');
	}
	
	
	window.onclick = function(event) {
	    if (!event.target.closest('.dropdown')) {
	       //이벤트 위임을 위해 closest사용
	       //currentTarget은 안된다 또 ,,
	      let dropdowns = document.getElementsByClassName("dropdown-content");
	      let i;
	      for (i = 0; i < dropdowns.length; i++) {
	        let openDropdown = dropdowns[i];
	        if (openDropdown.classList.contains('show')) {
	          openDropdown.classList.remove('show');
	        }
	      }
	    }
	  }

  //후기 이름 색깔

  if(window.location.pathname=="/mypage/review"){
      
    let reviewName = document.querySelector(".content-description .kinds-review div:nth-child(1)");
    reviewName.style.color="#333"
  }
  if(window.location.pathname=="/mypage/review-seller"){
      
    let reviewName = document.querySelector(".content-description .kinds-review li:nth-child(2) div");
    reviewName.style.color="#333"
  }
  if(window.location.pathname=="/mypage/review-buyer"){
      
    let reviewName = document.querySelector(".content-description .kinds-review li:nth-child(3) div");
    reviewName.style.color="#333"
  }



  //purchas-sell,wish 이름 색깔
  if(window.location.pathname=="/mypage/purchase-sell"||window.location.pathname=="/mypage/purchase-wish"){
    let purchaseName = document.querySelector(".kinds-deal.kinds-purchase li:nth-child(1) div");
    purchaseName.style.color="#333"
  }
  if(window.location.pathname=="/mypage/purchase-sell-soldout"||window.location.pathname=="/mypage/purchase-wish-village"){
    let purchaseName = document.querySelector(".kinds-deal.kinds-purchase li:nth-child(2) div");
    purchaseName.style.color="#333"
  }


  let loadImg  = function(event) {
        let reader = new FileReader();
        reader.onload = function(){
          let preImg = document.getElementById('account-image-preview');
          preImg.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
      };
