package com.market.oi.community;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class CommunityMapperTest {

	@Autowired
	private CommunityMapper communityMapper;
	
	@Test
	void getListTest() throws Exception{
		List<CommunityVO> ar = communityMapper.getList();
		System.out.println(ar.size());
		
		for(CommunityVO communityVO : ar) {
			System.out.println(communityVO.toString());
		}
		
		assertNotNull(ar);
	}
	
	//@Test
	void getSelectTest() throws Exception{
		CommunityVO communityVO = new CommunityVO();
		
		communityVO.setNum(2L);
		
		communityVO = communityMapper.getSelect(communityVO);
		
		System.out.println("Num : "+communityVO.getNum());
		System.out.println("Writer : "+communityVO.getWriter());
		System.out.println("Contents : "+communityVO.getContents());
		System.out.println("Category : "+communityVO.getCategoryNum());
		
		assertNotNull(communityVO);
	}

}
