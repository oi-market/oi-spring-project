package com.market.oi.community.comments;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsMapper{
	
	// 댓글 List
	public List<CommentsVO> getList(CommentsVO commentsVO) throws Exception;
	
	//댓글 Select
	public CommentsVO getSelect(CommentsVO commentsVO) throws Exception;
	
	// 댓글 Insert
	public int setInsert(CommentsVO commentsVO) throws Exception;
	
	// 댓글 Delete
	public int setDelete(CommentsVO commentsVO) throws Exception;
	
	// 댓글 Update
	public int setUpdate(CommentsVO commentsVO) throws Exception;
	
	
	// 댓글 Reply
	//insert
	public int setReply(CommentsVO commentsVO) throws Exception;
	
	//update
	public int setReplyUpdate(CommentsVO commentsVO) throws Exception;

	//step update
	public int stepUpdate(CommentsVO commentsVO) throws Exception;
	
	//totalCount
	public Long getTotalCount(CommentsVO commentsVO) throws Exception;
	
}
