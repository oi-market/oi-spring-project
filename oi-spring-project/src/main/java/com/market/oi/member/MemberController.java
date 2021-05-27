package com.market.oi.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("memberJoin")
	public void memberJoin()throws Exception{
		
	}
	
	@GetMapping("memberLogin")
	public String memberLogin() throws Exception{
		
		return "member/memberLogin";
	}

	@GetMapping("memberLoginFail")
	public String memberLoginFail()throws Exception{
		
		return "member/memberLogin";
	}
	
}
