package com.market.oi.community.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentsService {
	
	@Autowired
	private CommentsMapper commentsMapper;
	
	public List<CommentsVO> getList(CommentsVO commentsVO) throws Exception{
		return commentsMapper.getList(commentsVO);
	}
	
	public CommentsVO getSelect(CommentsVO commentsVO) throws Exception{
		return commentsMapper.getSelect(commentsVO);
	}
	
	public int setInsert(CommentsVO commentsVO) throws Exception{
		return commentsMapper.setInsert(commentsVO);
	}
	
	public int setDelete(CommentsVO commentsVO) throws Exception{
		
		int result = commentsMapper.setDelete(commentsVO);
		
		System.out.println("comments service result : "+result);
		
		return result;
	}
	
	public int setUpdate(CommentsVO commentsVO) throws Exception{
		return commentsMapper.setUpdate(commentsVO);
	}

}
