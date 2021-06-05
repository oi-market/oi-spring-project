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
	
	//@Test
//	void getListTest() throws Exception{
//		
//		CommunityVO communityVO = new CommunityVO();
//		
//		//현재 기본값을 0L로 설정
//		//communityVO.setCategoryNum(1L);
//		
//		List<CommunityVO> ar = communityMapper.getList(communityVO);
//		System.out.println("ar의size : "+ar.size());
//		//0
//		
//		for(int i=0; i<ar.size(); i++) {
//			System.out.println(ar.toString());
//		}	
//		assertNotNull(ar);
//	}
	
	//@Test
	void getSelectTest() throws Exception{
		CommunityVO communityVO = new CommunityVO();
		
		communityVO.setNum(1L);
		
		communityVO = communityMapper.getSelect(communityVO);
		
		System.out.println("Num : "+communityVO.getNum());
		System.out.println("Writer : "+communityVO.getWriter());
		System.out.println("Contents : "+communityVO.getContents());
		System.out.println("CategoryNum : "+communityVO.getCategoryNum());
		System.out.println("category : "+communityVO.getCategory());
		
		assertNotNull(communityVO);
	}
	
	//@Test
	void setInsertTest() throws Exception{
		CommunityVO communityVO = new CommunityVO();
		
		communityVO.setCategoryNum(2L);
		communityVO.setWriter("writer4");
		communityVO.setContents("contents4");
		communityVO.setLocation("마포구");
		
		int result = communityMapper.setInsert(communityVO);
		
		assertNotEquals(0, result);
	}
	
	@Test
	void setUpdateTest() throws Exception{
		CommunityVO communityVO = new CommunityVO();
		
		communityVO.setNum(6L);
		
		communityVO = communityMapper.getSelect(communityVO);
		
		System.out.println("num : "+communityVO.getNum());
		
		communityVO.setWriter("writerUpdate");
		communityVO.setContents("contentsUpdate");
		
		int result = communityMapper.setUpdate(communityVO);
		
		assertNotNull(result);
	}
	
	
	//@Test
	void setDeleteTest() throws Exception{
		CommunityVO communityVO = new CommunityVO();
		
		communityVO.setNum(5L);
		
		int result = communityMapper.setDelete(communityVO);
		
		assertNotNull(result);
	}

}
