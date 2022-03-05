package com.market.oi.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.market.oi.util.CommunityFileManager;
import com.market.oi.util.CommunityPager;

@Mapper
public interface CommunityMapper {
	
	//List
	public List<CommunityVO> getList(CommunityPager communityPager) throws Exception;
	
	//Count
	public Long getTotalCount(CommunityPager communityPager) throws Exception;
	
	//Select
	public CommunityVO getSelect(CommunityVO communityVO) throws Exception;
	
	//Insert
	public int setInsert(CommunityVO communityVO) throws Exception;

	//Delete
	public int setDelete(CommunityVO communityVO) throws Exception;
	
	//Update
	public int setUpdate(CommunityVO communityVO) throws Exception;
	
	//좋아요 Update
	
	
	//file upload
	
	public int setFileInsert(CommunityfilesVO communityfilesVO) throws Exception;
	
	public int setFileDelete(CommunityfilesVO communityfilesVO) throws Exception;
	
	public CommunityfilesVO getFileSelect(CommunityfilesVO communityfilesVO)throws Exception;

}
