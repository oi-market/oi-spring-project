package com.market.oi.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommunityMapper {
	
	//List
	public List<CommunityVO> getList() throws Exception;
	
	//Select
	public CommunityVO getSelect(CommunityVO communityVO) throws Exception;
	
	//Insert
	public int setInsert(CommunityVO communityVO) throws Exception;
	
	//Delete
	public int setDelete(CommunityVO communityVO) throws Exception;
	
	//Update
	public int setUpdate(CommunityVO communityVO) throws Exception;
	
	//좋아요 Update

}
