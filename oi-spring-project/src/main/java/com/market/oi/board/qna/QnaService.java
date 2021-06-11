package com.market.oi.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.oi.board.BoardService;
import com.market.oi.board.BoardVO;
import com.market.oi.util.Pager;

@Service
public class QnaService implements BoardService{
	
	@Autowired
	private QnaMapper qnaMapper;
	
	

	@Override
	public List<BoardVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		
		pager.makeNum(qnaMapper.getTotalCount(pager));
		return qnaMapper.getList(pager);
	}

	@Override
	public BoardVO getSelect(BoardVO boardVO) throws Exception {
		
		return qnaMapper.getSelect(boardVO);
	}

	@Override
	public int setInsert(BoardVO boardVO, MultipartFile[] files) throws Exception {
		
		int result = qnaMapper.setInsert(boardVO);
		
		return result;
	}

	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		
		return qnaMapper.setUpdate(boardVO);
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		
		return qnaMapper.setDelete(boardVO);
	}


}
