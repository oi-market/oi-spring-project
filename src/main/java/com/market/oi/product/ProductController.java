package com.market.oi.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.market.oi.member.MemberFileVO;
import com.market.oi.member.MemberService;
import com.market.oi.member.MemberVO;
import com.market.oi.myPage.MyPageService;
import com.market.oi.util.Pager;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("product/list")
	public void getProductList(Model model,
							Authentication auth,
							MemberVO memberVO,
							Pager pager,
							ProductVO productVO)throws Exception{
		List<ProductVO> ar = productService.getProductList(auth, memberVO, pager, productVO);
		
		
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		
		if(productVO.getCategoryNum()==0){
			productVO= null;
		}
		model.addAttribute("productVO", productVO);
		
	}
		@GetMapping("product/select")
	public void getProductSelect(Model model,ProductVO productVO,Authentication auth)throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		productVO=productService.getProductSelect(productVO);
		MemberVO memberVO =productVO.getMembers().get(0);
		MemberFileVO memberFileVO = memberService.selectImage(memberVO);
		

		Double score = memberService.Score(memberVO);
		if(score==null) score= 0.0;
		score =( Math.round(score * 100) / 100.0);
		double scoreStar = 20*score;
		
		
		if(memberFileVO!=null) model.addAttribute("imgName", memberFileVO.getFileName());
		model.addAttribute("sessionId", sessionMember.getUsername());
		model.addAttribute("vo",productVO);
		model.addAttribute("scoreStar",scoreStar);
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
	
	
	@GetMapping("product/update")
	public void getProductUpdate(ProductVO productVO,Model model)throws Exception{
		productVO = productService.getProductSelect(productVO);
		model.addAttribute("vo", productVO);
	}
	@PostMapping("product/update")
	public String setProductUpdate(ProductVO productVO,MultipartFile[] files)throws Exception{
		int result = productService.setProductUpdate(productVO, files);
		return "redirect:./list";
	}
	
	
	@PostMapping("product/fileDelete")
	public String getProductFileDelete(ProductFilesVO productFilesVO)throws Exception{
		
		productFilesVO = productService.getFileSelectFromFileNum(productFilesVO);
		int result = productService.setDeleteFileOne(productFilesVO);
		
		
		String rtn = "redirect:./update?num="+productFilesVO.getProductNum();
		return rtn;
	}
	
	@PostMapping("product/setWish")
	public String setWish(ProductVO productVO, Authentication auth)throws Exception{
		
		int result = productService.setWish(productVO, auth);
		String rst = "redirect:./select?num="+productVO.getNum();
		
		return rst;
	}
	
	
}
