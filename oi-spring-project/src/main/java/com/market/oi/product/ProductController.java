package com.market.oi.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.market.oi.member.MemberVO;
import com.market.oi.util.Pager;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	
	@GetMapping("product/list")
	public void getProductList(Model model,
							Authentication auth,
							MemberVO memberVO,
							Pager pager,
							ProductVO productVO
												)throws Exception{
		List<ProductVO> ar = productService.getProductList(auth, memberVO, pager, productVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		
		if(productVO.getCategoryNum()==0){
			productVO= null;
		}
		model.addAttribute("productVO", productVO);
		
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
	
	@PostMapping("product/delete")
	public String getProductDelete(ProductVO productVO,ProductFilesVO productFilesVO)throws Exception{
		int result = productService.setDeleteProduct(productFilesVO, productVO);
		return "redirect:./list";
	}
	
	
	
}
