package com.market.oi.member;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



import lombok.Data;

@Data
public class MemberVO {

	@Length(min =6 , max=12)
	private String username;
	
	@NotEmpty(message ="닉네임을 입력하시오")
	private String nickName;
	
	@Length(min = 8, max = 16)
	private String password;
	
	private String password1;
	
	@NotEmpty(message ="이름을 입력하시오")
	private String name;
	@Email
	@NotEmpty(message="이메일을 입력하시오")
	private String email;
	
	@NotEmpty(message="전화번호를 입력하시오")
	private String phone;
	
	@NotEmpty(message="주소를 입력하시오")
	private String location;



	
	
	
	
	
}
