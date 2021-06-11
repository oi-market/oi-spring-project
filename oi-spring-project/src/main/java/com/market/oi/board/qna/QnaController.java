package com.market.oi.board.qna;

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
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "qna";
	}
	
	
	
	@GetMapping("qnaList")
	public String getList(Pager pager, Model model)throws Exception{
		List<BoardVO> ar = qnaService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		for(BoardVO boardVO :ar) {
			QnaVO qnaVO = (QnaVO)boardVO;
//			System.out.println(qnaVO.getDepth());
		}
		return "board/qnaList";
	}
	
	@GetMapping("qnaSelect")
	public ModelAndView getSelect(BoardVO boardVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		boardVO = qnaService.getSelect(boardVO);
		System.out.println(boardVO);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/qnaSelect");
		return mv;
	}	
	
	@GetMapping("qnaInsert")
	public String setInsert(Model model)throws Exception{
		model.addAttribute("vo", new BoardVO());
		model.addAttribute("action", "insert");
		return "board/qnaInsert";
	}
	
	@PostMapping("qnaInsert")
	public String setInsert(BoardVO boardVO, MultipartFile [] files)throws Exception{
		int result = qnaService.setInsert(boardVO, files);
		
		return "redirect:./qnaList";
	}

	@GetMapping
	@GetMapping("qnaUpdate")
	public ModelAndView setUpdate(BoardVO boardVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("업데이트 전");
		boardVO = qnaService.getSelect(boardVO);
		mv.addObject("vo", boardVO);
		mv.addObject("board", "qna");
		mv.setViewName("board/qnaUpdate");
		
		return mv;
	}
	
	@PostMapping("qnaUpdate")
	public String setUpdate(BoardVO boardVO, Model model)throws Exception{
		
		int result = qnaService.setUpdate(boardVO);
		
		if(result>0) {
			
		}
		
		return "redirect:./qnaList";	
	}
	
	
	
	@GetMapping("qnaDelete")
	public String setDelete(BoardVO boardVO)throws Exception{
		System.out.println(boardVO);
		int result = qnaService.setDelete(boardVO);
		
		return "redirect:./qnaList";
	}

}
