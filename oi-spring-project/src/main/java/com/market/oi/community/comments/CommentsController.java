package com.market.oi.community.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.market.oi.member.MemberVO;


@Controller
@RequestMapping("/comments/**")
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	
	// 댓글 Insert
	@GetMapping("commentsInsert")
	public ModelAndView setInsert() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		CommentsVO commentsVO = new CommentsVO();
		
		mv.addObject("vo", commentsVO);
		mv.setViewName("neighborhood/select");

		return mv;
	}
		
	@PostMapping("commentsInsert")
	public ModelAndView setInsert(CommentsVO commentsVO, Authentication auth) throws Exception{
		
		//MemberVO가 UserDetail를 상속
		//				<-	principal에서 꺼냄
		UserDetails user = (UserDetails)auth.getPrincipal();
		//꺼낸 걸 memberVO로 변환해서 넣음
		MemberVO memberVO = (MemberVO)user;
		
		commentsVO.setWriter(memberVO.getUsername());
		commentsVO.setLocation(memberVO.getLocation());
		
		ModelAndView mv = new ModelAndView();
		int result = commentsService.setInsert(commentsVO);
		
		mv.setViewName("redirect:../neighborhood/board");
		
		return mv;
	}
	
	
	// 댓글 Delete
	@GetMapping("commentsDelete")
	public ModelAndView commentsDelete(CommentsVO commentsVO, Authentication auth) throws Exception{
			
		//MemberVO가 UserDetail를 상속
		//				<-	principal에서 꺼냄
		UserDetails user = (UserDetails)auth.getPrincipal();
		//꺼낸 걸 memberVO로 변환해서 넣음
		MemberVO sessionMember = (MemberVO)user;
		
		//select
		commentsVO = commentsService.getSelect(commentsVO);
		
		ModelAndView mv = new ModelAndView();
		
		//변수 선언
		String message = "삭제 권한이 없습니다!";
		String path = "../neighborhood/board";
		int result = 0;
		
		System.out.println("username : "+sessionMember.getUsername());
		System.out.println("writer : "+commentsVO.getWriter());
		
		if(sessionMember.getUsername().equals(commentsVO.getWriter())) {
			result = commentsService.setDelete(commentsVO);
		}
		
		System.out.println("comments result : "+result);
		
		if(result > 0) {
			message = "삭제에 성공했습니다!";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/communityResult");
		
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
			mv.setViewName("redirect:../neighborhood/board");
		}
		
		//실행 X
		else {
			System.out.println("수정에 실패했습니다!");
			mv.setViewName("redirect:../neighborhood/board");
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
		
		mv.setViewName("redirect:../community/communityList");
		
		return mv;
		
	}

}
