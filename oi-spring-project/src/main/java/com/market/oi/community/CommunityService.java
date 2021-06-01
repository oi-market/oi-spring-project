package com.market.oi.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityService {
	
	@Autowired
	private CommunityMapper communityMapper;
	
	//List
	public List<CommunityVO> getList() throws Exception{
		
		List<CommunityVO> ar = communityMapper.getList();
		
		return ar;
		
	}
	
	//Select
	public CommunityVO getSelect(CommunityVO communityVO) throws Exception{
		
		communityVO = communityMapper.getSelect(communityVO);
		
		return communityVO;
	}
	
	//Insert
	public int setInsert(CommunityVO communityVO) throws Exception{
		return communityMapper.setInsert(communityVO);
	}
	
	//Delete
	public int setDelete(CommunityVO communityVO) throws Exception{
		return communityMapper.setDelete(communityVO);
	}
	
	//Update
	public int setUpdate(CommunityVO communityVO) throws Exception{
		return communityMapper.setUpdate(communityVO);
	}
	
	//좋아요 수 Update

}
