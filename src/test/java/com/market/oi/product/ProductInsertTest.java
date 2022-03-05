package com.market.oi.product;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;



@SpringBootTest
public class ProductInsertTest {

	@Autowired
	private ProductMapper productMapper;
	
	
	@Test
	void insertTest()throws Exception{
		
		int result=0;
		
		for(int i=0 ; i<113; i++) {
		ProductVO productVO = new ProductVO();
		productVO.setCategoryNum(1);
		productVO.setContents("contest");
		productVO.setLocation("경기 성남시 분당구 판교역로 235");
		productVO.setPrice("50,000");
		productVO.setTitle("제목입니다");
		productVO.setUsername("id1");
		productVO.setWgs84X(127.108638414972);
		productVO.setWgs84Y(37.402095568027);	
		result = productMapper.setProductInsert(productVO);
		}
		
		
		assertNotEquals(0, result);
	}
	
	
	
}
