package com.market.oi.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	
	@GetMapping("product/list")
	public void getProductList(Model model,Authentication auth)throws Exception{
		List<ProductVO> ar = productService.getProductList(auth);		
		model.addAttribute("list", ar);
	}
	
	@GetMapping("product/separatedList")
	public void getProductSeparatedList(Model model,Authentication auth,ProductVO productVO)throws Exception{
		List<ProductVO> ar = productService.getProductSeparatedList(auth, productVO);		
		model.addAttribute("list", ar);
	}
	
	
	
	
	
	
}
