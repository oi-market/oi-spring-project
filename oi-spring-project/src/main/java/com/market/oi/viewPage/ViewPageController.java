package com.market.oi.viewPage;

import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
@RequestMapping("/viewPage/**")
public class ViewPageController {

	@Autowired
	public ViewPageService viewPageService;
	
	@Autowired
	public MemberService memberService;


	@GetMapping("viewList")
	public void viewList()throws Exception {

	}
	
	


	@GetMapping("viewProfile")
	public void viewProfile(MemberVO memberVO,Model model) throws Exception{


		memberVO=viewPageService.getUsername(memberVO);
		
		System.out.println(memberVO);


		MemberFileVO memberFileVO = memberService.selectImage(memberVO);
		
		System.out.println(memberFileVO);
		Double score = memberService.Score(memberVO);
		
		if(score==null) {
			score= 0.0;
		}
		score =( Math.round(score * 100) / 100.0);
		
		if(memberFileVO!=null) {
			model.addAttribute("imgName", memberFileVO.getFileName());
		}

		
		
		System.out.println(score);
		int change = 20;
		double scoreStar = change*score;
		System.out.println(score);
		model.addAttribute("memberVO",memberVO);
		model.addAttribute("score",score);
		model.addAttribute("scoreStar",scoreStar);

		
		
		
	}

	@GetMapping("viewPurchase-sell")
	public ModelAndView getPurchasesell(MemberVO memberVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		memberVO=viewPageService.getUsername(memberVO);
		mv.addObject("memberVO",memberVO);
		mv.setViewName("viewPage/viewPurchase-sell");
		


		
		return mv;

	}
	
	@GetMapping("viewPurchase-sell-soldout")
	public ModelAndView getPurchasesSoldout(MemberVO memberVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		memberVO=viewPageService.getUsername(memberVO);
		mv.addObject("memberVO",memberVO);
		mv.setViewName("viewPage/viewPurchase-sell-soldout");
		

		
		return mv;

	}

	@GetMapping("viewReview")
	public ModelAndView getreview(MemberVO memberVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		memberVO=viewPageService.getUsername(memberVO);
		mv.addObject("memberVO",memberVO);
		mv.setViewName("viewPage/viewReview");
		

		
		return mv;
	}
	@GetMapping("viewReview-seller")
	public ModelAndView getreviewSeller(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO=viewPageService.getUsername(memberVO);
		mv.addObject("memberVO",memberVO);
		mv.setViewName("viewPage/viewReview-seller");
		
;

		
		return mv;
	}
	@GetMapping("viewReview-buyer")
	public ModelAndView getreviewBuyer(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO=viewPageService.getUsername(memberVO);
		mv.addObject("memberVO",memberVO);
		mv.setViewName("viewPage/viewReview-buyer");
		

		
		return mv;
	}
	@GetMapping("viewVillage")
	public ModelAndView getVillage(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO=viewPageService.getUsername(memberVO);
		mv.addObject("memberVO",memberVO);
		mv.setViewName("viewPage/viewVillage");
		


		
		return mv;
	}
	@GetMapping("viewVillage-list")
	public ModelAndView getVillageList(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO=viewPageService.getUsername(memberVO);
		mv.addObject("memberVO",memberVO);
		mv.setViewName("viewPage/viewVillage-list");
		


		
		return mv;
	}
	@GetMapping("viewVillage-comment")
	public ModelAndView getVillageComment(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO=viewPageService.getUsername(memberVO);
		mv.addObject("memberVO",memberVO);
		mv.setViewName("viewPage/viewVillage-comment");
		


		
		return mv;
	}

}
