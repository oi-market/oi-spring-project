/**
 * 
 */
$(".sendMail").click(function() {// 메일 입력 유효성 검사
		var email = $(".email").val(); //사용자의 이메일 입력값. 
		
		if (email == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			email = email+"@"+$(".domain").val(); //셀렉트 박스에 @뒤 값들을 더함.
			$.ajax({
				type : 'post',
				url : '/CheckMail',
				data : {
					email:email
					},
				dataType :'json',

			});
			alert("인증번호가 전송되었습니다.") 
			isCertification=true; //추후 인증 여부를 알기위한 값
		}
	});