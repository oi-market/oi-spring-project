package com.market.oi.myPage;

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

import com.market.oi.member.MemberVO;
import com.market.oi.util.MypagePager;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("mypage/purchase-buy")
	public ModelAndView getbuyList(ProductVO productVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();		
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
				
		//내가 구매한 상품 list
		List<ProductVO> list = myPageService.getBuyList(productVO);
		mv.addObject("order", list);
		mv.addObject("vo", productVO);
		
		mv.setViewName("mypage/purchase-buy");
		
		System.out.println("buy 로그인:"+memberVO);
		System.out.println(list.size());
		
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

		System.out.println("로그인:"+memberVO);
		System.out.println(ar.size());
		return mv;
	}
	
	@GetMapping("mypage/purchase-sell-soldout")
	public ModelAndView getsoldList(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		//내가 판매하는 상품 중 판매완료된 것 list
		List<ProductVO> ar = myPageService.getSellList(productVO);		
		mv.addObject("sell", ar);
		mv.addObject("vo", productVO);
		mv.setViewName("mypage/purchase-sell-soldout");
		
		return mv;
	}
	
	
	@GetMapping("mypage/purchase-wish")
	public ModelAndView getwishList(MywishVO mywishVO,Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();		
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
		
		//나의 관심 list
		List<MywishVO> wish = myPageService.getMywish(memberVO);
		System.out.println("로그인: "+memberVO);
		mv.addObject("wish", wish);
		mv.addObject("vo", mywishVO);
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
		//int result = myPageService.likeDelete(productVO);
		
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
	public ModelAndView getReviewList(ReviewVO reviewVO) throws Exception {
		ModelAndView mv = new ModelAndView();		
	
		List<ReviewVO> review = myPageService.getReview(reviewVO);
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
}
