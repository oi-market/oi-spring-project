package com.market.oi.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/community/**")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	//List
	@GetMapping("communityList")
	public ModelAndView getList(ModelAndView mv, CommunityVO communityVO) throws Exception{
		
		List<CommunityVO> ar = communityService.getList(communityVO);
		
		mv.addObject("list", ar);
		mv.setViewName("community/communityList");
		
		return mv;
	}
	
	//Select
	@GetMapping("communitySelect")
	public ModelAndView getSelect(CommunityVO communityVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		communityVO = communityService.getSelect(communityVO);
		
		mv.addObject("vo", mv);
		mv.setViewName("community/communitySelect");
		
		return mv;
	}
	
	//Insert
	@GetMapping("communityInsert")
	public ModelAndView setInsert() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", new CommunityVO());
		mv.setViewName("community/communityInsert");

		return mv;
	}
	
	
	@PostMapping("communityInsert")
	public String setInsert(CommunityVO communityVO, Model model) throws Exception{

		int result = communityService.setInsert(communityVO);
		
		String message = "등록에 실패했습니다!";
		String path = "./communityList";
		
		if(result>0) {
			message = "등록에 성공했습니다!";
		}

		model.addAttribute("msg", message);
		model.addAttribute("path", path);
		
		return "common/commonResult";
		
	}
	
	//Delete
	@GetMapping("communityDelete")
	public ModelAndView setDelete(CommunityVO communityVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = communityService.setDelete(communityVO);
		
		String message = "삭제에 실패했습니다!";
		String path = "./communityList";
		
		if(result > 0) {
			message = "삭제를 성공적으로 마쳤습니다!";
		}

		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		
		return mv;
	}
	
	//Update
	@GetMapping("communityUpdate")
	public ModelAndView setUpdate(CommunityVO communityVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//값 가져오기
		communityVO = communityService.getSelect(communityVO);
		
		mv.addObject("vo", communityVO);
		mv.setViewName("community/communityUpdate");
		
		return mv;
	}
	
	@PostMapping("communityUpdate")
	public ModelAndView setUpdate(CommunityVO communityVO, ModelAndView mv) throws Exception{
		
		int result = communityService.setUpdate(communityVO);
		
		//실행 O
		if(result>0) {
			System.out.println("수정에 성공했습니다!");
			mv.setViewName("redirect:./communityList");
		}
		
		//실행 X
		else {
			System.out.println("수정에 실패했습니다!");
			mv.setViewName("redirect:./communityList");
		}
		
		return mv;
	}

}
