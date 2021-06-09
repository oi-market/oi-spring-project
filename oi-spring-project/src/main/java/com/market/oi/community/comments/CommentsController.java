package com.market.oi.community.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/comments/**")
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	
	
//	//댓글 Select
//	@GetMapping("commentsSelect")
//	public ModelAndView getSelect(CommentsVO commentsVO) throws Exception{
//		
//		ModelAndView mv = new ModelAndView();
//		
//		commentsVO = commentsService.getSelect(commentsVO);
//		
//		mv.addObject("vo", commentsVO);
//		mv.setViewName("community/communitySelect");
//		
//		return mv;
//	}
	
	
	// 댓글 Insert
	@GetMapping("commentsInsert")
	public ModelAndView setInsert() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		CommentsVO commentsVO = new CommentsVO();
		
		mv.addObject("vo", commentsVO);
		mv.setViewName("community/communitySelect");

		return mv;
	}
		
	@PostMapping("commentsInsert")
	public ModelAndView setInsert(CommentsVO commentsVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = commentsService.setInsert(commentsVO);
		
		mv.setViewName("redirect:../community/communityList");
		
		return mv;
	}
	
	
	// 댓글 Delete
	@GetMapping("commentsDelete")
	public ModelAndView commentsDelete(CommentsVO commentsVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = commentsService.setDelete(commentsVO);
		String message = "삭제 실패";
		String path = "../community/communityList";
		
		System.out.println("comments result : "+result);
		
		if(result > 0) {
			message = "삭제 성공";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		
		return mv;
	}
	
	//댓글 Update
	@GetMapping("commentsUpdate")
	public ModelAndView setUpdate(CommentsVO commentsVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//값 가져오기
		commentsVO = commentsService.getSelect(commentsVO);
		
		mv.addObject("comments", commentsVO);
		mv.setViewName("comments/commentsUpdate");
		
		return mv;
	}
	
	@PostMapping("commentsUpdate")
	public ModelAndView setUpdate(CommentsVO commentsVO, ModelAndView mv) throws Exception{
		
		int result = commentsService.setUpdate(commentsVO);
		System.out.println("result : "+result);
		
		//실행 O
		if(result>0) {
			System.out.println("수정에 성공했습니다!");
			mv.setViewName("redirect:../community/communityList");
		}
		
		//실행 X
		else {
			System.out.println("수정에 실패했습니다!");
			mv.setViewName("redirect:../community/communityList");
		}
		
		return mv;
	}
	
	
	
	//댓글 reply
	@GetMapping("commentsReply")
	public ModelAndView setReply() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		CommentsVO commentsVO = new CommentsVO();
							
		mv.setViewName("comments/commentsReply");
		
		return mv;
		
	}
	
	@PostMapping("commentsReply")
	public ModelAndView setReply(CommentsVO commentsVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = commentsService.setReply(commentsVO);
		
		System.out.println("reply result: "+result);
		
		mv.setViewName("../community/communityList");
		
		return mv;
		
	}

}
