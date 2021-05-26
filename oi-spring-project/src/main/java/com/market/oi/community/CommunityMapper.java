package com.market.oi.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommunityMapper {
	
	//List
	public List<CommunityVO> getList() throws Exception;

}
