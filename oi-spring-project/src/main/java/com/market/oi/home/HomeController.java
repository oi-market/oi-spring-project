package com.market.oi.home;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.market.oi.member.MemberVO;

@Controller
public class HomeController {

	
	
	@GetMapping("/")
	public String getHome()throws Exception{
		return "index";
	}
	@GetMapping("/member/sign-in")
	public String getSignIn()throws Exception{
		return "member/sign-in";
	}
	@GetMapping("/member/sign-up")
	public String getSignUp(@ModelAttribute MemberVO memberVO)throws Exception{
		return "member/sign-up";
	}
	@GetMapping("member/find-id")
	public void getFindId()throws Exception{
	}
	@GetMapping("member/find-pw")
	public void getFindPw()throws Exception{
	}
	@GetMapping("mypage/profile")
	public void getProfile()throws Exception{
	}

	
	@GetMapping("mypage/village")
	public void getVillage()throws Exception{
	}
	@GetMapping("mypage/village-list")
	public void getVillageList()throws Exception{
	}
	@GetMapping("mypage/village-comment")
	public void getVillageComment()throws Exception{
	}
	@GetMapping("mypage/password")
	public void getSetPassword()throws Exception{
	}
	@GetMapping("mypage/modify")
	public void getModify()throws Exception{
	}

	@GetMapping("neighborhood/board")
	public void getVillageBoard()throws Exception{
	}
	@GetMapping("neighborhood/select")
	public void getVillageSelect()throws Exception{
	}
	@GetMapping("neighborhood/insert")
	public void getVillageInsert()throws Exception{
	}
	@GetMapping("product/list")
	public void getProductList()throws Exception{
	}
	@GetMapping("product/select")
	public void getProductSelect()throws Exception{
	}
	@GetMapping("product/insert")
	public void getProductInsert()throws Exception{
	}
	@GetMapping("board/insert")
	public void getBoardInsert()throws Exception{
	}
	@GetMapping("board/select")
	public void getBoardSelect()throws Exception{
	}
	@GetMapping("board/list")
	public void getBoardList()throws Exception{
	}



	

	
}
