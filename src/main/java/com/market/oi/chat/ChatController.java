package com.market.oi.chat;

import java.util.ArrayList;
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

import com.market.oi.member.MemberFileVO;
import com.market.oi.member.MemberService;
import com.market.oi.member.MemberVO;
import com.market.oi.product.ProductVO;

@Controller
@RequestMapping("/chat/**")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@Autowired
	private MemberService memberService; 
	
	@GetMapping("productList")
	public ModelAndView getProductList(ProductVO productVO, ChatVO chatVO, Authentication auth) throws Exception {
		
		//session => memberVO
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		ModelAndView mv = new ModelAndView();
		
		productVO.setUsername(sessionMember.getUsername());

		System.out.println("username : "+sessionMember.getUsername());
		System.out.println("productVO : "+productVO);
		
		
		List<ChatVO> ar = chatService.getProductList(productVO);
		
		System.out.println("ar : "+ar.size());
		
		mv.addObject("list", ar);
		mv.addObject("chat", chatVO);
		mv.setViewName("chat/productList");
		
		return mv;
		
	}

	
	
	@GetMapping("chatList")
	public ModelAndView getChatList(ChatVO chatVO, Authentication auth, Model model) throws Exception {
		
		//session => memberVO
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		
		ModelAndView mv = new ModelAndView();
		
		if(chatVO.getCheck() == null) {
			chatVO.setCheck(1);
		}
		int setCheck = chatVO.getCheck();
		if(chatVO.getCheck() == 1) {
			chatVO.setSellerID(sessionMember.getUsername());
			System.out.println("sellerID :"+sessionMember.getUsername());
		} else{
			chatVO.setBuyerID(sessionMember.getUsername());
			System.out.println("productNum : "+chatVO.getProductNum());
			System.out.println("sellerID :"+chatVO.getSellerID());
		}
		
		System.out.println("check : "+chatVO.getCheck());
		System.out.println("productNum : "+chatVO.getProductNum());
		System.out.println("BuyerID : "+chatVO.getBuyerID());
		System.out.println("productNum : "+chatVO.getProductNum());
		
		List<ChatVO>buyerAr = chatService.getBuyerList(chatVO);
		 System.out.println(buyerAr);
		
		//======================================
			//프로필 이미지 변경부분!
			
			List<MemberFileVO> chatFileList = new ArrayList<MemberFileVO>();
			System.out.println(buyerAr.size());
			if(setCheck == 1) {
				for(int i =0; i<buyerAr.size(); i++) {
					MemberFileVO memberFileVO = new MemberFileVO();
					buyerAr.get(i).setCheck(1);
					memberFileVO = chatService.getBuyerFileList(buyerAr.get(i));
					System.out.println(buyerAr);
					buyerAr.get(i).setMemberFileVO(memberFileVO);
//					chatFileList.add(memberFileVO);
					System.out.println("이거봐봐"+buyerAr);
				}
			}else {
				for(int i =0; i<buyerAr.size(); i++) {
					MemberFileVO memberFileVO = new MemberFileVO();
					buyerAr.get(i).setCheck(2);
					memberFileVO.setUsername(buyerAr.get(i).getSellerID());
					memberFileVO = chatService.getBuyerFileList(buyerAr.get(i));
					buyerAr.get(i).setMemberFileVO(memberFileVO);
//					chatFileList.add(memberFileVO);
					System.out.println("이거보자"+buyerAr);
				}
				
			}
			
			System.out.println(chatFileList);
			
			
		//////////////////////////////
		 /*
		 for(int i = 0; i<buyerAr.size(); i++) {
			 String strYear = buyerAr.get(i).get("buyuerID").toString();
		 }
		 */
		List<ChatVO> chatAr = chatService.getChatList(chatVO);
		System.out.println("buyerAr : "+buyerAr.size());
		System.out.println("chatAr : "+chatAr.size());
//		mv.addObject("imgList",chatFileList);
		mv.addObject("buyerList", buyerAr);
		mv.addObject("chatList", chatAr);
		mv.addObject("username", sessionMember.getUsername());
		mv.setViewName("chat/chatList");
		
		return mv;
		
	}
	
	
	@GetMapping("chatSelect")
	public ModelAndView getChatSelect(ChatVO chatVO, Authentication auth) throws Exception {
		
		//session => memberVO
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		ModelAndView mv = new ModelAndView();
		
		chatVO = chatService.getChatSelect(chatVO);
		
		mv.addObject("vo", chatVO);
		mv.addObject("username", sessionMember.getUsername());
		mv.setViewName("chat/chatSelect");
		
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
		
		System.out.println("insert start");
		
		//session => memberVO
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		chatVO.setSenderID(sessionMember.getUsername());
		
		System.out.println("senderID : "+chatVO.getSenderID());
		
		//값 비교 : buyer, seller
		if(chatVO.getBuyerID().equals(sessionMember.getUsername())) {
			chatVO.setReceiverID(chatVO.getSellerID());
		} else{
			chatVO.setReceiverID(chatVO.getBuyerID());
		}
		
		System.out.println("receiverID : "+chatVO.getReceiverID());
		
		String message = "쪽지를 보내는데 실패했습니다!";
		String path = "./productList";
		
		int result = chatService.setChatInsert(chatVO);
		
		if(result > 0) {
			message = "쪽지를 보내는데 성공했습니다!";
		}
		
		model.addAttribute("path", path);
		model.addAttribute("msg", message);
		
		return "chat/chatInsert";
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
