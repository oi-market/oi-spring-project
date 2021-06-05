package com.market.oi.util;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class CommunityFileManager {
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	//save
	public String save(String filePath, MultipartFile multipartFile) throws Exception {
		
		//filePath : /resources/static/ 제외한 하위경로
		
		String path = "static";
		ClassPathResource classPathResource = new ClassPathResource(path);
														//뒤에 오는 주소
		File file = new File(classPathResource.getFile(), filePath);
		
		System.out.println(file.getAbsolutePath());
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//2. 저장할 파일명을 생성
		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		System.out.println("fileName : "+fileName);
		
		file = new File(file, fileName);
		
		//transfer
		multipartFile.transferTo(file);
		//아래와 같음 ,  transfer가 진행되야 파일이 넘어감
		//FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		return fileName;
		
	}
	
	
	//delete
	public boolean delete(String filePath, String fileName) throws Exception{
		
		String path = "static";
		ClassPathResource classPathResource = new ClassPathResource(path);
														//뒤에 오는 주소
		File file = new File(classPathResource.getFile(), filePath);
		
		boolean check = false;
		
		if(file.exists()) {
			check = file.delete();
		}
		
		return check;
	}

}
