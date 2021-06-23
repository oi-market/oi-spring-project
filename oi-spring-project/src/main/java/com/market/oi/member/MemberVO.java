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
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Data
public class MemberVO implements UserDetails{

	
	@NotEmpty(message="아이디를 입력하시오")
	@Length(min =6 , max=12)
	private String username;
	
	@NotEmpty(message ="닉네임을 입력하시오")
	private String nickName;
	
	@Length(min = 8, max = 16)
	@NotEmpty(message="패스워드를 입력하시오")
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
	
	
	
	private List<RoleVO> roles;
	
	
	private MemberFileVO memberFileVO;

	
	//role 저장
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for(RoleVO roleVO:this.roles) {
			authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));
		}
		return authorities;
	}

	
	//아이디가 없으면 안됨
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	//계정이 락이걸렷냐
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	//유효기간
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	//계정 사용 여부
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
	
	
	
}
