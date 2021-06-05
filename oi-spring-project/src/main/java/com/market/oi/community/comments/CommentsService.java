package com.market.oi.community.comments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentsService {
	
	@Autowired
	private CommentsMapper commentsMapper;
	
	public CommentsVO getSelect(CommentsVO commentsVO) throws Exception{
		return commentsMapper.getSelect(commentsVO);
	}
	
	public int setInsert(CommentsVO commentsVO) throws Exception{
		return commentsMapper.setInsert(commentsVO);
	}
	
	public int setDelete(CommentsVO commentsVO) throws Exception{
		return commentsMapper.setDelete(commentsVO);
	}
	
	public int setUpdate(CommentsVO commentsVO) throws Exception{
		return commentsMapper.setUpdate(commentsVO);
	}

}
