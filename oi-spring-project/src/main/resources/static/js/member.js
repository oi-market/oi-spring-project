/**
¿ * 
 */




var isCertification=false;
var CheckNum;
//회원가입 클릭
$("#join_btn").click(function(){
	//
	if($("input:checkbox[id='mainCheck']").is(":checked") == false){
		alert("이용약관에 동의해주세요.")
	}
	else if(isCertification==false){
		alert("메일 인증이 되지않았습니다.")
	}
	else{
		$("#joinForm").submit();
		}
});	

//아이디 글자수
/*
$("#username").on("blur",function(){

	let message = "최소 6 글자 최대 12글자 입니다";
	   if(username.value.length>5 && 13>username.value.length){
	      message = "";
	   }else {
		   
	   }   
	   idResult.innerHTML=message;
});
*/
//아이디 중복확인

function idCheck(){
var username = $("#username").val();
var usernameTrim= $.trim(username);
	if(usernameTrim.length>13||usernameTrim.length<6||username==null){
		alert("아이디는 6글자 이상 12글자 이하로 만드십시오.")
	}else{	
	
	$.ajax({
		type : 'GET',
		url : 'idCheck',
		data : {
			"username" : username,
		},

		dataType :'text',
		
		success : function(result) {
	         result = result.trim();
	         if(result==='null'){
	            alert("중복되지않은 ID입니다.");
	            idCehckResult=true;
	         }else{
	            alert("이미 있는 ID입니다.");
	            idCehckResult=false;
	        
	    }
	
		}
	})
	}
}

//비밀번호 (min = 8, max = 16)
/*
$("#password").on("blur",function(){

   let message2 = "최소 8 글자 최대 16글자 입니다";

   if(password.value.length>7 && 17>password.value.length){
      message2 ="";
   }
   
   pwResult.innerHTML=message2;
   
});
*/
//비밀번호 확인

$("#password1").on("blur",function(){
   let message2 = "";

   if(password.value != password1.value){
      password1.value="";
      message2 = "비밀번호가 같지않습니다.";   
   }
     
   pwResult2.innerHTML=message2;
});
	

// 주소찾기 api
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	var address = data.address
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}



//이메일 인증번호 보내기
function sendMail(){
	var email = $("#email").val(); //사용자의 이메일 입력값.
	var test = email.indexOf("@");
	
	if (email == "") {
		alert("메일 주소가 입력되지 않았습니다.");
	}else if(test==-1){
		
		alert("메일 형식이 잘못되었습니다.");
	} 
	else {
		$.ajax({
			type : 'GET',
			url : 'CheckMail',
			data : {
				"email" : email,
			},

			dataType :'text',
			
			success : function(data) {
		         CheckNum = data;
		    //  alert(CheckNum);
				alert("인증번호가 전송되었습니다.")
		        
		    },
			
		    error:function(requeest, status, error){
		    	alert(error);
		    },

			

		});
		
		
	}
		
}

//이메일 인증번호 확인

function emailCheck(){
	 var emailNum = $("#emailNum").val();
	    if (emailNum == CheckNum) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
			alert("인증성공");
			isCertification = true;
	    } else {	
	    	alert("인증실패");
	    	isCertification = false;
	    }
 };


//아이디 찾기
 $("#find_ID").click(function () {
		 var name = $("#name").val();
		 var email = $("#email").val();
		 var phone = $("#phone").val();
		if (email == "" || name=="" || phone=="") {
			alert("정보를 입력해주시기 바랍니다.");
		}else{ $.ajax({
			type : 'POST',
			url : 'memberFindID',
			data : {
				email	:	email,
				name	:	name,
				phone	:	phone,
			},

			dataType :'text',
			
			success : function(data) {
				
				msg = data;
		        alert(msg);
		        message =$("message").val("principal.username");
//		        $("#showID").modal("show");
		       
		        
		    }
			
	 })
		} 
		
	})



     
