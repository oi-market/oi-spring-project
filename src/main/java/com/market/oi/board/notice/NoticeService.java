package com.market.oi.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.oi.board.BoardService;
import com.market.oi.board.BoardVO;
import com.market.oi.util.Pager;

@Service
public class NoticeService implements BoardService{
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	

	@Override
	public List<BoardVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		System.out.println(pager.getSearch());
		
		pager.makeNum(noticeMapper.getTotalCount(pager));

		System.out.println(noticeMapper.getTotalCount(pager));
		return noticeMapper.getList(pager);
	}

	@Override
	public BoardVO getSelect(BoardVO boardVO) throws Exception {
		
		return noticeMapper.getSelect(boardVO);
	}

	@Override
	public int setInsert(BoardVO boardVO, MultipartFile[] files) throws Exception {
		
		int result = noticeMapper.setInsert(boardVO);
		
		return result;
	}

	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		
		return noticeMapper.setUpdate(boardVO);
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		
		return noticeMapper.setDelete(boardVO);
	}


}
