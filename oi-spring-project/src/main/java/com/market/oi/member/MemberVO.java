package com.market.oi.member;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class MemberVO {

	@Length(min =6 , max=12)
	private String id;
	private String nickName;
	
	@Length(min = 8, max = 16)
	private String pw;
	
	private String pw1;
	@NotEmpty(message ="이름을 입력하시오")
	private String name;
	@Email
	@NotEmpty(message="이메일을 입력하시오")
	private String email;
	
	@NotEmpty(message="전화번호를 입력하시오")
	private String phoneNum;
	private String location;
	private String profilePhoto;
	
}
