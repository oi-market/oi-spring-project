package com.market.oi.myPage;


import java.util.ArrayList;
import java.security.Principal;
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


import com.market.oi.community.CommunityService;
import com.market.oi.community.CommunityVO;
import com.market.oi.community.comments.CommentsVO;

import com.market.oi.member.MemberFileVO;
import com.market.oi.member.MemberService;
import com.market.oi.member.MemberVO;
import com.market.oi.product.ProductService;
import com.market.oi.util.MypagePager;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("mypage/purchase-buy")
	public ModelAndView getbuyList(OrderPFileVO orderPFileVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();		
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
				
		//내가 구매한 상품 list
		List<OrderPFileVO> list = myPageService.getBuyList(memberVO);
		mv.addObject("order", list);
		mv.addObject("vo", orderPFileVO);		
		mv.setViewName("mypage/purchase-buy");
				
		return mv;
	}
	
	@GetMapping("mypage/purchase-sell")
	public void getsellList(PFileVO pFileVO, Authentication auth, Model model) throws Exception {
		ModelAndView mv = new ModelAndView();
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
		
		//내가 판매하는 중인 상품 list
		List<PFileVO> ar = myPageService.getList(memberVO);
		model.addAttribute("list", ar);
		model.addAttribute("mypage/purchase-sell");
		
		System.out.println("판매상품"+memberVO);
		System.out.println(ar.size());
	}
	
	@GetMapping("mypage/purchase-sell-soldout")
	public ModelAndView getsoldList(PFileVO pFileVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
		
		//내가 판매하는 상품 중 판매완료된 것 list
		List<PFileVO> ar = myPageService.getSellList(memberVO);	
		mv.addObject("sell", ar);
		mv.addObject("vo", pFileVO);
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
	@GetMapping("mypage/soldoutUpdate")
	public String soldoutUpdate(ProductVO productVO,Authentication auth,Model model) throws Exception {		
		//컨펌 으로 확인 한번 해주면 조을듯
		

		
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMemeber = (MemberVO)user;
		List<MemberVO> ar = memberService.getChatMembers(sessionMemeber);
		model.addAttribute("list", ar);
		
		
		

		
		//구매자 선택 페이지로 이동 --> 최근 채팅한 사람 불러오기 (리시버 id가 세션 본인일때 센더 아이디 전부 불러와서 보여주기) 및 나중에 하-> ordercomplete
		
		//판매 완료 페이지에서 구매자 설정 dropdown 추가 , if 판매완료 테이블에 produtnum이 없다면 보일수 있도록
		
		
		return "mypage/selectBuyer";
	}
	@PostMapping("mypage/soldoutUpdate")
	public String soldoutUpdate(ProductVO productVO,OrdercompleteVO ordercompleteVO,Model model)throws Exception{
		int result = myPageService.soldoutUpdate(productVO);		
		System.out.println("업데이트");
		result= productService.setOrderComplete(ordercompleteVO);
		String message = "상품 판매 완료 실패!";
		
		
		if(result > 0) {
			message = "상품 판매 완료 성공했습니다!";
		}
		
		model.addAttribute("msg", message);
		
		 
		 return "mypage/selectBuyer";
		
	}
	
	//판매중 변경 
	@GetMapping("mypage/sellUpdate")
	public String sellUpdate(ProductVO productVO,OrdercompleteVO ordercompleteVO) throws Exception {
		int result = myPageService.sellUpdate(productVO);
		System.out.println("판매중");
		//마이페이지에 있는 orderComplete 로 메퍼부터 변경 예정
		result = productService.setDeleteOrderComplete(ordercompleteVO);
		
		
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
	
	//상품 선택
	@GetMapping("mypage/productSelect")
	public ModelAndView getSelect(ProductVO productVO, MywishVO mywishVO, ModelAndView mv) throws Exception {
		int result = myPageService.setHitUpdate(productVO);
		
		productVO = myPageService.getSelect(productVO);		
		mv.addObject("vo", productVO);
		
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
	
		Long countReview  = myPageService.countReview(memberVO);
		mv.addObject("countReview", countReview);
		
		List<ReviewVO> review = myPageService.getReviewList(memberVO);
		mv.addObject("review", review);
		mv.addObject("vo", reviewVO);
		mv.setViewName("mypage/review");
		
		return mv;
	}
	
	//판매자 작성 리뷰
	@GetMapping("mypage/review-seller")
	public ModelAndView getreviewSeller(ReviewVO reviewVO, Authentication auth)throws Exception{
		ModelAndView mv = new ModelAndView();		
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
		
		Long countSeller  = myPageService.countSeller(memberVO);
		mv.addObject("countSeller", countSeller);
		
		List<ReviewVO> seller = myPageService.getSeller(memberVO);
		mv.addObject("seller", seller);
		mv.addObject("vo", reviewVO);		
		mv.setViewName("mypage/review-seller");
		
		return mv;
	}
	
	//구매자 작성 리뷰
	@GetMapping("mypage/review-buyer")
	public ModelAndView getreviewBuyer(ReviewVO reviewVO, Authentication auth) throws Exception{
		ModelAndView mv = new ModelAndView();		
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
		
		Long countBuyer  = myPageService.countBuyer(memberVO);
		mv.addObject("countBuyer", countBuyer);
		
		List<ReviewVO> buyer = myPageService.getBuyer(memberVO);
		mv.addObject("buyer", buyer);
		mv.addObject("vo", reviewVO);	
		mv.setViewName("mypage/review-buyer");

		return mv;
	}
	
	//리뷰 작성 페이지
	@GetMapping("mypage/reviewInsert")
	public ModelAndView setReview(Authentication authentication, ModelAndView mv, ProductVO productVO) throws Exception {	
		//session 받아오기
		MemberVO memberVO = new MemberVO();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
				
		productVO = myPageService.reviewInsert(productVO);	
		mv.addObject("vo", productVO);
		
		String seller = myPageService.seller(productVO);
		mv.addObject("seller", seller);
		
		String buyer = myPageService.buyer(productVO);
		mv.addObject("buyer", buyer);
		
		String user = myPageService.getUser(productVO);
		mv.addObject("user", user);		
		mv.setViewName("mypage/reviewInsert");
		
		return mv;
	}
	
	@PostMapping("mypage/reviewInsert")
	public String setReview(Authentication authentication, ModelAndView mv, MemberVO memberVO, ReviewVO reviewVO) throws Exception {
		//session 받아오기
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		
		int result = myPageService.setReview(reviewVO);
				
		return "redirect:review";
	}
	
	@GetMapping("mypage/review-insert")
	public ModelAndView review(Authentication authentication, ModelAndView mv, ProductVO productVO) throws Exception {	
		//session 받아오기
		MemberVO memberVO = new MemberVO();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
				
		productVO = myPageService.reviewInsert(productVO);	
		mv.addObject("vo", productVO);
		
		String seller = myPageService.seller(productVO);
		mv.addObject("seller", seller);
		
		mv.setViewName("mypage/review-insert");
		
		return mv;
	}
	
	@PostMapping("mypage/review-insert")
	public String review(Authentication authentication, ModelAndView mv, MemberVO memberVO, ReviewVO reviewVO) throws Exception {
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
		

		


		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("comment", commentList);
		
		
		return mv;
	}
	
	
	@GetMapping("mypage/village-list")
	public ModelAndView getVillage(CommunityVO communityVO, Authentication auth) throws Exception {
		ModelAndView mv = new ModelAndView();		
		//session 받아오기
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO memberVO = (MemberVO)user;
				
		List<CommunityVO> list = myPageService.getVillage(memberVO);
		mv.addObject("list", list);
		mv.addObject("vo", communityVO);		
		
		mv.setViewName("mypage/village-list");
				
		return mv;
	}
	

}
