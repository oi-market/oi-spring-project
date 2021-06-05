package com.market.oi.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	public String getSignUp()throws Exception{
		return "member/sign-up";
	}
	@GetMapping("mypage/purchase-wish")
	public void getPurchaseWish()throws Exception{
		
	}
	@GetMapping("mypage/purchase-sell")
	public void getPurchasesell()throws Exception{
		
	}
	@GetMapping("mypage/purchase-buy")
	public void getPurchaseBuy()throws Exception{
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


	
}
