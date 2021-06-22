package com.market.oi.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	
	@GetMapping("product/list")
	public void getProductList(Model model)throws Exception{
		List<ProductVO> ar = productService.getProductList();
		model.addAttribute("list", ar);
	}
	
	
	
	
	
}
