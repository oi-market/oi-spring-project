package com.market.oi.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.market.oi.board.BoardVO;
import com.market.oi.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "notice";
	}
	

	
	
	
	@GetMapping("noticeList")
	public String getList(Pager pager, Model model)throws Exception{
		List<BoardVO> ar = noticeService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		for(BoardVO boardVO :ar) {
			NoticeVO noticeVO = (NoticeVO)boardVO;
//			System.out.println(noticeVO.getDepth());
		}
		return "board/boardList";
	}
	
	@GetMapping("noticeSelect")
	public ModelAndView getSelect(BoardVO boardVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		boardVO = noticeService.getSelect(boardVO);
		System.out.println(boardVO);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardSelect");
		return mv;
	}	
	
	@GetMapping("noticeInsert")
	public String setInsert(Model model)throws Exception{
		model.addAttribute("vo", new BoardVO());
		model.addAttribute("action", "insert");
		return "board/boardInsert";
	}
	
	@PostMapping("noticeInsert")
	public String setInsert(BoardVO boardVO, MultipartFile [] files)throws Exception{
		int result = noticeService.setInsert(boardVO, files);
		
		return "redirect:./noticeList";
	}

	@GetMapping("noticeUpdate")
	public ModelAndView setUpdate(BoardVO boardVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("업데이트 전");
		boardVO = noticeService.getSelect(boardVO);
		mv.addObject("vo", boardVO);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardUpdate");
		
		return mv;
	}
	
	@PostMapping("noticeUpdate")
	public String setUpdate(BoardVO boardVO, Model model)throws Exception{
		
		int result = noticeService.setUpdate(boardVO);
		
		if(result>0) {
			
		}
		
		return "redirect:./noticeList";	
	}
	
	
	
	@GetMapping("noticeDelete")
	public String setDelete(BoardVO boardVO)throws Exception{
		System.out.println(boardVO);
		int result = noticeService.setDelete(boardVO);
		
		return "redirect:./noticeList";
	}

}
