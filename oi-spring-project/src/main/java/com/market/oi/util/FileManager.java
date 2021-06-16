package com.market.oi.util;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

	@Autowired
	private ResourceLoader resourceLoader;
	
	public String save(MultipartFile multipartFile, String filePath) throws Exception {
		//경로 설정 
		String path ="classpath:/static/";
		File file = new File(resourceLoader.getResource(path).getFile(),filePath);
		
		System.out.println(file.getAbsolutePath()); //경로확인하기
		
		if(!file.exists()) {
			file.mkdir();
		}
		
		//저장할 파일명 
		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		//저장
		file = new File(file, fileName);
		multipartFile.transferTo(file);
		
		return fileName;
	}
}
