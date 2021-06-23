package com.market.oi.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping("product/select")
	public void getProductSelect(Model model,ProductVO productVO)throws Exception{
		productVO=productService.getProductSelect(productVO);
		model.addAttribute("vo",productVO);
	}
	@GetMapping("product/insert")
	public void getProductInsert()throws Exception{
	}
	@PostMapping("product/insert")
	public String getProductInsertPost(ProductVO productVO,MultipartFile[] files)throws Exception{
		int result =productService.setProductInsert(productVO, files);
		return "redirect:./list";
	}
	
	
	
	
}
