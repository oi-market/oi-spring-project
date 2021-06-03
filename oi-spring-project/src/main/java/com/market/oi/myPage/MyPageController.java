package com.market.oi.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	//상품 리스트
	@GetMapping("myPage/myPage")
	public ModelAndView getList(ProductVO productVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		//내가 판매하는 상품 list
		List<ProductVO> ar = myPageService.getList(productVO);		
		mv.addObject("list", ar);
		mv.addObject("vo", productVO);
		mv.setViewName("myPage/myPage");
		//내가 구매한 상품 list
		List<ProductVO> list = myPageService.getBuyList(productVO);
		mv.addObject("order", list);
		mv.addObject("vo", productVO);
		
		return mv;
	}
	
	//상품 선택
	@GetMapping("myPage/productSelect")
	public ModelAndView getSelect(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		productVO = myPageService.getSelect(productVO);
		
		mv.addObject("vo", productVO);
		mv.setViewName("myPage/productSelect");
		
		return mv;
	}
	
	//상품 수정
	@GetMapping("myPage/productUpdate")
	public String setUpdate(ProductVO productVO, Model model) throws Exception {
		productVO = myPageService.getSelect(productVO);
		model.addAttribute("vo", productVO);
		
		return "myPage/productUpdate";
	}	
	
	@PostMapping("myPage/productUpdate")
	public String setUpdate(ProductVO productVO) throws Exception {	
		int result = myPageService.setUpdate(productVO);
		
		if(result>0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");		
		}
		
		return "redirect:./myPage";
	}
	
	//상품 삭제
	@GetMapping("myPage/productDelete")
	public String setDelete(ProductVO productVO) throws Exception {
		int result = myPageService.setDelete(productVO);		
		System.out.println("삭제 성공");
		
		return "redirect:./myPage";
	}
	
	//판매완료 변경
	//product 테이블의 sale 부분 1(판매완료)로 변경
	@GetMapping("myPage/saleUpdate")
	public String saleUpdate(ProductVO productVO) throws Exception {
		int result = myPageService.saleUpdate(productVO);		
		System.out.println("업데이트");	
		
		return "redirect:./myPage";
	}
}
