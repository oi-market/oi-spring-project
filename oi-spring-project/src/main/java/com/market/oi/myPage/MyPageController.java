package com.market.oi.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("mypage/purchase-buy")
	public ModelAndView getbuyList(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		//내가 구매한 상품 list
		List<ProductVO> list = myPageService.getBuyList(productVO);
		mv.addObject("order", list);
		mv.addObject("vo", productVO);
		mv.setViewName("mypage/purchase-buy");
		
		return mv;
	}
	
	@GetMapping("mypage/purchase-sell")
	public ModelAndView getsellList(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		//내가 판매하는 상품 list
		List<ProductVO> ar = myPageService.getList(productVO);		
		mv.addObject("product", ar);
		mv.addObject("vo", productVO);
		mv.setViewName("mypage/purchase-sell");
		
		return mv;
	}
	
	@GetMapping("mypage/purchase-sell-soldout")
	public ModelAndView getsoldList(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		//내가 판매하는 상품 list
		List<ProductVO> ar = myPageService.getSellList(productVO);		
		mv.addObject("sell", ar);
		mv.addObject("vo", productVO);
		mv.setViewName("mypage/purchase-sell-soldout");
		
		return mv;
	}
	
	
	@GetMapping("mypage/purchase-wish")
	public ModelAndView getwishList(MywishVO mywishVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		//나의 관심 list
		List<MywishVO> wish = myPageService.getMywish(mywishVO);
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
	public ModelAndView getSelect(ProductVO productVO, MywishVO mywishVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = myPageService.setHitUpdate(productVO);
		
		productVO = myPageService.getSelect(productVO);		
		mv.addObject("vo", productVO);
		mv.setViewName("mypage/productSelect");
		
		return mv;
	}
	
}
