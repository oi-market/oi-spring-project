package com.market.oi.myPage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.market.oi.community.CommunityVO;
import com.market.oi.community.comments.CommentsVO;
import com.market.oi.member.MemberFileVO;
import com.market.oi.member.MemberService;
import com.market.oi.member.MemberVO;
import com.market.oi.util.MypagePager;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("mypage/purchase-buy")
	public ModelAndView getbuyList(ProductVO productVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();		
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
				
		//내가 구매한 상품 list
		List<ProductVO> list = myPageService.getBuyList(memberVO);
		mv.addObject("order", list);
		mv.addObject("vo", productVO);		
		mv.setViewName("mypage/purchase-buy");
				
		return mv;
	}
	
	@GetMapping("mypage/purchase-sell")
	public ModelAndView getsellList(ProductVO productVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
		
		//내가 판매하는 중인 상품 list
		List<ProductVO> ar = myPageService.getList(memberVO);		
		mv.addObject("product", ar);
		mv.addObject("vo", productVO);	
		mv.setViewName("mypage/purchase-sell");

		return mv;
	}
	
	@GetMapping("mypage/purchase-sell-soldout")
	public ModelAndView getsoldList(ProductVO productVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
		
		//내가 판매하는 상품 중 판매완료된 것 list
		List<ProductVO> ar = myPageService.getSellList(memberVO);		
		mv.addObject("sell", ar);
		mv.addObject("vo", productVO);
		mv.setViewName("mypage/purchase-sell-soldout");
		
		return mv;
	}
	
	
	@GetMapping("mypage/purchase-wish")
	public ModelAndView getwishList(PWishVO pwishVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();		
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
		
		// 나의 관심 list		
		List<PWishVO> list = myPageService.getMywish(memberVO);
		mv.addObject("list", list);
		mv.addObject("vo", pwishVO);
		
		mv.setViewName("mypage/purchase-wish");		

		return mv;
	}
	
	//판매완료 변경
	//product 테이블의 sale 부분 1(판매완료)로 변경
	@GetMapping("mypage/soldoutUpdate")
	public String soldoutUpdate(ProductVO productVO) throws Exception {
		int result = myPageService.soldoutUpdate(productVO);		
		System.out.println("업데이트");	
		
		return "redirect:purchase-sell";
	}
	
	//판매중 변경 
	@GetMapping("mypage/sellUpdate")
	public String sellUpdate(ProductVO productVO) throws Exception {
		int result = myPageService.sellUpdate(productVO);
		System.out.println("판매중");
		
		return "redirect:purchase-sell";
	}
	
	//상품 삭제
	@GetMapping("mypage/productDelete")
	public String setDelete(ProductVO productVO) throws Exception {
		int result = myPageService.setDelete(productVO);		
		System.out.println("삭제 성공");
		
		return "redirect:purchase-sell";
	}
	
	//관심상품 해제
	@GetMapping("mypage/setWishDelete")
	public String setWishDelete(MywishVO mywishVO, ProductVO productVO) throws Exception {
		//상품 테이블의 like -1
		int delete = myPageService.likeDelete(mywishVO);		
		System.out.println("like-1 성공");
		
	    //관심상품 데이터 삭제
		int result = myPageService.setWishDelete(mywishVO);					
		System.out.println("삭제 성공");
		
		return "redirect:purchase-wish";
	}
	
	//관심상품 추가
	@GetMapping("mypage/setWishInsert")
	public String setWishInsert(ProductVO productVO) throws Exception {	
		//선택한 상품 insert
		productVO = myPageService.getSelect(productVO); 
		int result = myPageService.setWishInsert(productVO);
		
		result = myPageService.likeUpdate(productVO);
			
		System.out.println("성공");
		return "redirect:purchase-wish";
	}
	
	//상품 수정
	@GetMapping("mypage/productUpdate")
	public String setUpdate(ProductVO productVO, Model model) throws Exception {
		productVO = myPageService.getSelect(productVO);
		model.addAttribute("vo", productVO);
		
		return "mypage/productUpdate";
	}
	
	@PostMapping("mypage/productUpdate")
	public String setUpdate(ProductVO productVO) throws Exception {	
		int result = myPageService.setUpdate(productVO);
		
		if(result>0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");		
		}
		
		return "redirect:purchase-sell";
	}
	
	
	//상품 선택
	@GetMapping("mypage/productSelect")
	public ModelAndView getSelect(ProductVO productVO, MywishVO mywishVO, ModelAndView mv) throws Exception {
		int result = myPageService.setHitUpdate(productVO);
		
		productVO = myPageService.getSelect(productVO);		
		mv.addObject("vo", productVO);
				
		/*
		 * //상품 선택 시 리뷰도 함께 
		 * ReviewVO reviewVO = new ReviewVO(); 
		 * reviewVO = myPageService.getReviewSelect(reviewVO); 
		 * mv.addObject("vo", reviewVO);
		 */
		
		mv.setViewName("mypage/productSelect");
		
		return mv;
	}
	
	//리뷰 리스트
	@GetMapping("mypage/review")
	public ModelAndView getReviewList(ReviewVO reviewVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();			
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
	
		List<ReviewVO> review = myPageService.getReview(memberVO);
		mv.addObject("review", review);
		mv.addObject("vo", reviewVO);
		
		mv.setViewName("mypage/review");
		
		return mv;
	}
	
	//판매자 작성 리뷰
	@GetMapping("mypage/review-seller")
	public ModelAndView getreviewSeller(ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();		
		
		List<ReviewVO> seller = myPageService.getSeller(reviewVO);
		mv.addObject("seller", seller);
		mv.addObject("vo", reviewVO);
		
		mv.setViewName("mypage/review-seller");
		
		return mv;
	}
	
	//구매자 작성 리뷰
	@GetMapping("mypage/review-buyer")
	public ModelAndView getreviewBuyer(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();		
		
		List<ReviewVO> buyer = myPageService.getBuyer(reviewVO);
		mv.addObject("buyer", buyer);
		mv.addObject("vo", reviewVO);
		
		mv.setViewName("mypage/review-buyer");

		return mv;
	}
	
	//리뷰 작성 페이지
	@GetMapping("mypage/reviewInsert")
	public ModelAndView setReview(ModelAndView mv, ProductVO productVO) throws Exception {	
		productVO = myPageService.reviewInsert(productVO);	
		mv.addObject("vo", productVO);
		mv.setViewName("mypage/reviewInsert");
		
		return mv;
	}
	
	@PostMapping("mypage/reviewInsert")
	public String setReview(Authentication authentication, MemberVO memberVO, ReviewVO reviewVO) throws Exception {
		//session 받아오기
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		
		int result = myPageService.setReview(reviewVO);
				
		return "redirect:review";
	}
	
	
	@GetMapping("mypage/modify")
	public void getModify(MemberVO memberVO,Authentication authentication,Model model)throws Exception{
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		System.out.println(memberVO);
		MemberFileVO memberFileVO = memberService.selectImage(memberVO);
		
//		Double score = memberService.Score(memberVO);
//		
//		if(score==null) {
//			score= 0.0;
//		}
//		score =( Math.round(score * 100) / 100.0);
		
		if(memberFileVO!=null) {
			model.addAttribute("imgName", memberFileVO.getFileName());
		}
		
//		System.out.println(score);
//		int change = 20;
//		double scoreStar = change*score;
//		System.out.println(score);
//		model.addAttribute("Score",score);
//		model.addAttribute("scoreStar",scoreStar);

	}
	
	
	
	
	@GetMapping("mypage/profile")
	public ModelAndView getProfile(MemberVO memberVO,Authentication authentication,Model model)throws Exception{
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		System.out.println(memberVO);
		MemberFileVO memberFileVO = memberService.selectImage(memberVO);
		
		Double score = memberService.Score(memberVO);
		
		if(score==null) {
			score= 0.0;
		}
		score =( Math.round(score * 100) / 100.0);
		
		if(memberFileVO!=null) {
			model.addAttribute("imgName", memberFileVO.getFileName());
		}
		Long countScore = memberService.countScore(memberVO);
		Long countProduct  = memberService.countProduct(memberVO);
		
		if(countScore==null) {
			countScore=0L;
		}
		if(countProduct==null) {
			countProduct=0L;
		}
		System.out.println(countScore);
		System.out.println(countProduct);
		System.out.println(score);
		int change = 20;
		double scoreStar = change*score;
		System.out.println(score);
		model.addAttribute("Score",score);
		model.addAttribute("scoreStar",scoreStar);
		model.addAttribute("countScore",countScore);
		model.addAttribute("countProduct",countProduct);
		/* 내가 받은 리뷰 띄워주기 */
		ReviewVO reviewVO = new ReviewVO();
		ModelAndView mv = new ModelAndView();
		List<ReviewVO> my = myPageService.getMyReview(memberVO);
		mv.addObject("my", my);
		mv.addObject("vo", reviewVO);		
		mv.setViewName("mypage/profile");
		

		return mv;
		
	}
	
	
	@GetMapping("mypage/village-comment")
	public ModelAndView getVillageComment(MemberVO memberVO,Authentication authentication)throws Exception{
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		
		CommunityVO communityVO = new CommunityVO(); 
		CommentsVO commentsVO = new CommentsVO();
		
		commentsVO.setWriter(memberVO.getUsername());
		List<CommentsVO> commentList = myPageService.getComment(commentsVO);
		
		
		System.out.println(commentList);
		for(int i =0; i<commentList.size(); i++) {
			if(commentList.get(i).getCommunityVO().getContents().length()>4) {
			String subContents = commentList.get(i).getCommunityVO().getContents().substring(0,4);
			commentList.get(i).getCommunityVO().setContents(subContents);
			System.out.println("subContents:"+commentList.get(i).getCommunityVO().getContents());
			}
		}
		


		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("comment", commentList);
		
		
		return mv;
	}
	
	
	
	
	
	
}
