package com.market.oi.location;


import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface LocationMapper {
	

	public int setLocation(LocationVO locationVO)throws Exception;
	
	public LocationVO searchLocation(LocationVO locationVO)throws Exception;
	

	
}
