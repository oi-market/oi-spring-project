package com.market.oi.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class CommunityFileManager {
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	public boolean delete(String name, String fileName, HttpSession session) throws Exception {
		
		//1. 경로 설정
		String path = session.getServletContext().getRealPath("resources/upload/"+name);
		File file = new File(path, fileName);
		
		boolean check = false;
		
		if(file.exists()) {
			check = file.delete();
		}
		
		return check;
		
	}
	
	public String save(String name, MultipartFile multipartFile, HttpSession session) throws Exception{
		
		//1. 경로 설정
		String path = session.getServletContext().getRealPath("resources/upload/"+name);
		System.out.println(path);
		
		File file = new File(path);
		System.out.println(file.exists());
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		
		//1-1. 저장할 파일명
		String fileName="";

		
		//2. API / UUID 이용해 중복제거
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		//3. HDD에 저장
		file = new File(file, fileName);
		
		multipartFile.transferTo(file);
		
		return fileName;
		
	}
	
//	//save
//	public String save(String filePath, MultipartFile multipartFile) throws Exception {
//		
//		//filePath : /resources/static/ 제외한 하위경로
//		
//		String path = "static";
//		ClassPathResource classPathResource = new ClassPathResource(path);
//														//뒤에 오는 주소
//		File file = new File(classPathResource.getFile(), filePath);
//		
//		System.out.println(file.getAbsolutePath());
//		
//		if(!file.exists()) {
//			file.mkdirs();
//		}
//		
//		//2. 저장할 파일명을 생성
//		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
//		
//		System.out.println("fileName : "+fileName);
//		
//		file = new File(file, fileName);
//		
//		//transfer
//		multipartFile.transferTo(file);
//		//아래와 같음 ,  transfer가 진행되야 파일이 넘어감
//		//FileCopyUtils.copy(multipartFile.getBytes(), file);
//		
//		return fileName;
//		
//	}
//	
//	
//	//delete
//	public boolean delete(String filePath, String fileName) throws Exception{
//		
//		String path = "static";
//		ClassPathResource classPathResource = new ClassPathResource(path);
//														//뒤에 오는 주소
//		File file = new File(classPathResource.getFile(), filePath);
//		
//		boolean check = false;
//		
//		if(file.exists()) {
//			check = file.delete();
//		}
//		
//		return check;
//	}
	

}
