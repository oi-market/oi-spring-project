package com.market.oi.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.market.oi.member.MemberVO;
import com.market.oi.product.ProductService;
import com.market.oi.product.ProductVO;
import com.market.oi.util.Pager;

@Controller
public class HomeController {

	@Autowired
	private  ProductService productService;
	
	
	@GetMapping("/")
	public String getHome(Model model)throws Exception{
		
		
		List<ProductVO> ar = productService.getPopularList();
		model.addAttribute("list", ar);
		
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
	

	
	@GetMapping("mypage/village")
	public void getVillage()throws Exception{
	}

//	@GetMapping("mypage/village-list")
//	public void getVillageList()throws Exception{
//	}
	
//
//	@GetMapping("mypage/village-comment")
//	public void getVillageComment()throws Exception{
//	}


	@GetMapping("mypage/password")
	public void getSetPassword()throws Exception{
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
