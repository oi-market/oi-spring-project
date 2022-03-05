package com.market.oi.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	@Autowired
	private TestMapper testMapper;
	
	public TestVO getSelect()throws Exception{
		return testMapper.getSelect();
	}
	
}
