package com.market.oi.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.market.oi.community.comments.CommentsService;
import com.market.oi.community.comments.CommentsVO;
import com.market.oi.util.CommunityPager;


@Controller
@RequestMapping("/community/**")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private CommentsService commentsService; 
	
	@Value("${community.filePath}")
	private String filePath;
	
	
	//커뮤니티 List
	@GetMapping("communityList")
	public ModelAndView getList(ModelAndView mv, CommunityPager communityPager) throws Exception{
		
		System.out.println("FilePath : "+filePath);
		
		List<CommunityVO> ar = communityService.getList(communityPager);
		CommentsVO commentsVO = new CommentsVO();
		
		mv.addObject("comments", commentsVO);
		
		mv.addObject("list", ar);
		mv.addObject("communityPager", communityPager);
		mv.setViewName("community/communityList");
		
		return mv;
	}
	
	//커뮤니티 Select
	@GetMapping("communitySelect")
	public ModelAndView getSelect(CommunityVO communityVO, CommentsVO commentsVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		communityVO = communityService.getSelect(communityVO);
		
		//comments select
		List<CommentsVO> ar = commentsService.getList(commentsVO);
		
		//System.out.println("writer : "+commentsVO.getWriter());
		
		mv.addObject("vo", communityVO);
		mv.addObject("comments", commentsVO);
		mv.addObject("list", ar);
		
		mv.setViewName("community/communitySelect");
		
		return mv;
	}
	
	//커뮤니티 Insert
	@GetMapping("communityInsert")
	public ModelAndView setInsert() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		CommunityVO communityVO = new CommunityVO();
		
		mv.addObject("vo", communityVO);
		mv.setViewName("community/communityInsert");

		return mv;
	}
	
	
	@PostMapping("communityInsert")
	public String setInsert(CommunityVO communityVO, MultipartFile [] files, Model model) throws Exception {
		
		for(MultipartFile f : files) {
			System.out.println(f.getOriginalFilename());
		}
		
		int result = communityService.setInsert(communityVO, files);
		
		String message = "등록에 실패했습니다!";
		String path = "./communityList";
		
		if(result>0) {
			message = "등록에 성공했습니다!";
		}

		model.addAttribute("msg", message);
		model.addAttribute("path", path);
		
		return "common/commonResult";
		
	}
	
	//커뮤니티 Delete
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
	
	//커뮤니티 Update
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
		System.out.println("result : "+result);
		
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
