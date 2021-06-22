package com.market.oi.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

	@Autowired
	private ResourceLoader resourceLoader;
	
	public boolean delete(String filePath,String fileName )throws Exception {
		//1. 경로 설정
//		String path = session.getServletContext().getRealPath("upload/"+name);
		
		
		String path="static";
		ClassPathResource classPathResource = new ClassPathResource(path);
		File file = new File(classPathResource.getFile(), filePath);
		
		
		System.out.println(path);
		file = new File(file, fileName);
//		File file = new File(path, fileName);
		
		boolean check = false;
		if(file.exists()) {
			check = file.delete();
		}
		return check;
	}
	
	public String save(MultipartFile multipartFile, String filePath)throws Exception{
		
		String path="static";
		ClassPathResource classPathResource = new ClassPathResource(path);
		File file = new File(classPathResource.getFile(), filePath);
		
		System.out.println(file.getAbsolutePath());

		System.out.println(file.getPath());

		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		file = new File(file, fileName);

		multipartFile.transferTo(file);

		return fileName;
	}
			


}