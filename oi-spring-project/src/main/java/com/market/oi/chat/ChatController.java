package com.market.oi.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.market.oi.member.MemberVO;

@Controller
@RequestMapping("/chat/**")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping("productList")
	public ModelAndView getProductList(ProductVO productVO, Authentication auth) throws Exception {
		
		//session => memberVO
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		ModelAndView mv = new ModelAndView();
		
		//chatVO.setBuyerID(sessionMember.getUsername());
		productVO.setUsername(sessionMember.getUsername());
		//System.out.println("BuyerID : "+sessionMember.getUsername());
		System.out.println("username : "+sessionMember.getUsername());
		
		List<ChatVO> ar = chatService.getProductList(productVO);
		
		mv.addObject("list", ar);
		mv.setViewName("chat/productList");
		
		return mv;
		
	}
	
	
//	@GetMapping("chatList")
//	public ModelAndView getBuyerList(ChatVO chatVO, Authentication auth) throws Exception {
//		
//		//session => memberVO
//		UserDetails user = (UserDetails)auth.getPrincipal();
//		MemberVO sessionMember = (MemberVO)user;
//		
//		ModelAndView mv = new ModelAndView();
//		
//		chatVO.setSellerID(sessionMember.getUsername());
//		System.out.println("SellerID : "+sessionMember.getUsername());
//		
//		List<ChatVO> ar = chatService.getBuyerList(chatVO);
//		
//		mv.addObject("list", ar);
//		mv.setViewName("chat/chatList");
//		
//		return mv;
//		
//	}
	
	
	@GetMapping("chatList")
	public ModelAndView getChatList(ChatVO chatVO, Authentication auth) throws Exception {
		
		//session => memberVO
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		ModelAndView mv = new ModelAndView();
		
		chatVO.setSellerID(sessionMember.getUsername());
		System.out.println("SellerID : "+sessionMember.getUsername());
		chatVO.setBuyerID(sessionMember.getUsername());
		System.out.println("BuyerID : "+sessionMember.getUsername());
		
		List<ChatVO> buyerAr = chatService.getBuyerList(chatVO);
		List<ChatVO> chatAr = chatService.getChatList(chatVO);
		
		mv.addObject("buyerList", buyerAr);
		mv.addObject("chatList", chatAr);
		mv.setViewName("chat/chatList");
		
		return mv;
		
	}
	
	
	@GetMapping("chatInsert")
	public ModelAndView setChatInsert() throws Exception {
		
		ChatVO chatVO = new ChatVO();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", chatVO);
		mv.setViewName("chat/chatInsert");
		
		return mv;
	}
	
	@PostMapping("chatInsert")
	public String setChatInsert(ChatVO chatVO, Authentication auth, Model model) throws Exception {
		
		//session => memberVO
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		chatVO.setBuyerID(sessionMember.getUsername());
		chatVO.setBuyerName(sessionMember.getNickName());
		
		String message = "쪽지를 보내는데 실패했습니다!";
		String path = "./productList";
		
		int result = chatService.setChatInsert(chatVO);
		
		if(result > 0) {
			message = "쪽지를 보내는데 성공했습니다!";
		}
		
		model.addAttribute("path", path);
		model.addAttribute("msg", message);
		
		return "common/communityResult";
	}
	
	
	@GetMapping("chatDelete")
	public ModelAndView setChatDelete(ChatVO chatVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = chatService.setChatDelete(chatVO);
		
		String message = "쪽지를 삭제하는데 실패했습니다!";
		String path = "./productList";
		
		if(result > 0) {
			message = "쪽지를 삭제했습니다!";
		}
		
		mv.addObject("path", path);
		mv.addObject("msg", message);
		mv.setViewName("common/communityResult");
		
		return mv;
		
	}
	
}
