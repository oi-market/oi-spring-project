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
	
	public int setReply(CommentsVO commentsVO) throws Exception{
		
		System.out.println("getnum : "+commentsVO.getNum());
		
		//부모글의 ref, step depth 조회
		CommentsVO parent = commentsMapper.getSelect(commentsVO);
		System.out.println("service ref : "+parent.getRef());
		System.out.println("service step : "+parent.getStep());
		System.out.println("service depth : "+parent.getDepth());
		
		commentsVO.setRef(parent.getRef());
		commentsVO.setStep(parent.getStep()+1);
		commentsVO.setDepth(parent.getDepth()+1);
		
		int result = commentsMapper.setReplyUpdate(parent);
		result = commentsMapper.setReply(commentsVO);
		
		return result;
	}

}
