package com.market.oi.test;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestMapper {

	public TestVO getSelect()throws Exception;
}
