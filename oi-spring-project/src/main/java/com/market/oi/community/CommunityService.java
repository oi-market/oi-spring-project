package com.market.oi.community;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.oi.util.CommunityFileManager;
import com.market.oi.util.CommunityPager;

@Service
public class CommunityService {
	
	@Autowired
	private CommunityMapper communityMapper;
	
	@Autowired
	private CommunityFileManager communityFileManager;
	
	@Value("${community.filePath}")
	private String filePath;

	
	//List
	public List<CommunityVO> getList(CommunityPager communityPager) throws Exception{
		
		communityPager.makeRow();
		Long totalCount = communityMapper.getTotalCount(communityPager);
		System.out.println("totalcount : "+totalCount);
		communityPager.makeNum(totalCount);
		
		System.out.println("startNum : "+communityPager.getStartNum());
		System.out.println("lastNum : "+communityPager.getLastNum());

		return communityMapper.getList(communityPager);
		
	}
	
	//Select
	public CommunityVO getSelect(CommunityVO communityVO) throws Exception{
			
		return communityMapper.getSelect(communityVO);
	}
	
	//Insert
	public int setInsert(CommunityVO communityVO, MultipartFile [] files) throws Exception{
		
		int result = communityMapper.setInsert(communityVO);
		
			//지역변수			맴버변수
		String filePath = this.filePath;
		
		for(MultipartFile multipartFile : files) {
			
			if(multipartFile.getSize() == 0) {
				continue;
			}
			
			String fileName = communityFileManager.save(filePath, multipartFile);
			System.out.println("fileName : "+fileName);
			
			CommunityfilesVO communityfilesVO = new CommunityfilesVO();
			communityfilesVO.setFileName(fileName);
			communityfilesVO.setOgName(multipartFile.getOriginalFilename());
			communityfilesVO.setNum(communityVO.getNum());
			
			communityMapper.setFileInsert(communityfilesVO);
			
		}
		
		return 0;//communityMapper.setFileInsert(communityfilesVO);
	}
	
	//Delete
	public int setDelete(CommunityVO communityVO) throws Exception{
		return communityMapper.setDelete(communityVO);
	}
	
	//Update
	public int setUpdate(CommunityVO communityVO) throws Exception{
		System.out.println("service result : "+communityMapper.setUpdate(communityVO));
		return communityMapper.setUpdate(communityVO);
	}
	
	//좋아요 수 Update

}
