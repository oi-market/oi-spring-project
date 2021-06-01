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
		
		CommunityVO communityVO = new CommunityVO();
		
		//현재 기본값을 0L로 설정
		//communityVO.setCategoryNum(1L);
		
		List<CommunityVO> ar = communityMapper.getList(communityVO);
		System.out.println("ar의size : "+ar.size());
		//0
		
		for(int i=0; i<ar.size(); i++) {
			System.out.println(ar.toString());
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
