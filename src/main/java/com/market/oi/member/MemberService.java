package com.market.oi.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.tools.JavaFileManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.multipart.MultipartFile;


import com.market.oi.util.FileManager;







@Service
public class MemberService implements UserDetailsService{

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	@Autowired
	private FileManager fileManager;
	
	//Login 메서드
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException  {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		System.out.println(username);
		
		memberVO = memberMapper.memberLogin(memberVO);
 
		System.out.println(memberVO.getAuthorities());
	
		System.out.println(memberVO);
		
		return memberVO;
	}
	
	
	
	
	public boolean memberError(MemberVO memberVO, Errors errors)throws Exception{
		boolean result = false;
		
		//기본 제공 검증  결과
//		if(errors.hasErrors()) {
//			result = true;
//		}
		result = errors.hasErrors();
		
		//password가 일치 여부 검증
		if(!memberVO.getPassword().equals(memberVO.getPassword1())) {
			errors.rejectValue("password1", "memberVO.password.notEqual");
						     //(form path, field 명, properties의 code(key));
			result=true;
		}
		
		//UserName 중복 여부
		MemberVO checkMember = memberMapper.getUsername(memberVO);
		//checkMember 가 null이면 중복 X
		//checkMember 가 null이 아니면 중복
		if(checkMember != null) {
			errors.rejectValue("username", "member.id.equal");
			result = true;
		}
		
		//admin, adminstrator, root
		
		System.out.println("Validate : "+result);
		return result;
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	public int memberJoin(MemberVO memberVO, MultipartFile multipartFile)throws Exception{
		//0. 사전 작업
		//a. password 암호화
		System.out.println(memberVO);
//		System.out.println(locationVO.getLocation());
//		System.out.println(locationVO.getWgs84X());
//		System.out.println(locationVO.getWgs84Y());
		 memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		 
		//b. 사용자 계정 활성화
		 

//		
//		//0. Location Table 저장
//		if(locationMapper.searchLocation(locationVO)==null) {
//			int result=locationMapper.setLocation(locationVO);
//		 }
		 
		
		//1. Member Table 저장
		int result =memberMapper.memberJoin(memberVO);
		
		
		
		//2. Role Table 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", memberVO.getUsername());
		map.put("roleName", "ROLE_MEMBER");
		result = memberMapper.setMemberRole(map);
		
		//2. HDD에 저장
//		String filePath= "upload/member/";
//		if(multipartFile.getSize() != 0) {
//			String fileName= fileManager.save(multipartFile, filePath);
//			System.out.println(fileName);
//			MemberFileVO memberFileVO = new MemberFileVO();
//			memberFileVO.setFileName(fileName);
//			memberFileVO.setOriName(multipartFile.getOriginalFilename());
//			memberFileVO.setUsername(memberVO.getUsername());
//		//3. MemberFiles table 저장
//			result = memberMapper.setJoinFile(memberFileVO);
//		}
//		
		return result;
	}
	
	public MemberVO memberFindID(MemberVO memberVO) throws Exception{
		return memberMapper.memberFindID(memberVO);
	}
	
	public MemberVO memberFindPW(MemberVO memberVO) throws Exception{
		return memberMapper.memberFindPW(memberVO);
	}
	
	public int memberUpdatePW(MemberVO memberVO)throws Exception{
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		
		return memberMapper.memberUpdatePW(memberVO);
		
	}
	
	
	public MemberVO idCheck(MemberVO memberVO)throws Exception{
		
		return  memberMapper.getUsername(memberVO);
		
	}

	
	public int memberUpdate(MemberVO memberVO)throws Exception{
		
		
		return memberMapper.memberUpdate(memberVO);
		
	}
	
	public int memberDelete(MemberVO memberVO)throws Exception{
		
		return memberMapper.memberDelete(memberVO);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int setImage(MemberVO memberVO,MultipartFile avatar)throws Exception {
		String filePath= "upload/member/";
		
				
			String fileName= fileManager.memberSave(avatar, filePath);
			System.out.println(fileName);
			MemberFileVO memberFileVO = new MemberFileVO();
			memberFileVO.setFileName(fileName);
			memberFileVO.setOgName(avatar.getOriginalFilename());
			memberFileVO.setUsername(memberVO.getUsername());
			int result = memberMapper.setJoinFile(memberFileVO);
			
			
			
		
		return result;
		
	}
	
	public MemberFileVO selectImage(MemberVO memberVO)throws Exception{
		return memberMapper.selectImage(memberVO);
	}
	
	public int delImage(MemberFileVO checkMem)throws Exception{
		String filePath= "upload/member/";
		
		fileManager.delete(filePath, checkMem.getFileName());
		
		return memberMapper.delImage(checkMem);
	}
	
	
	public Double Score(MemberVO memberVO) {
		
		return memberMapper.Score(memberVO);
	}

	public int memberUpdateRadius(MemberVO memberVO,Authentication auth)throws Exception{
		
		
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMemberVO = (MemberVO)user;
		
		memberVO.setUsername(sessionMemberVO.getUsername());
		int result =memberMapper.memberUpdateRadius(memberVO);
		sessionMemberVO.setRadius(memberVO.getRadius());
		
		return result;
	}
	public int memberUpdateLocation(MemberVO memberVO,Authentication auth)throws Exception{
	
		
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMemberVO = (MemberVO)user;
			
		memberVO.setUsername(sessionMemberVO.getUsername());
		int result =memberMapper.memberUpdateLocation(memberVO);
		sessionMemberVO.setLocation(memberVO.getLocation());
		sessionMemberVO.setWgs84X(memberVO.getWgs84X());
		sessionMemberVO.setWgs84Y(memberVO.getWgs84Y());
		
		return result;
	}

	public Long countScore(MemberVO memberVO)throws Exception{
		return memberMapper.countScore(memberVO);
	}

	public Long countProduct(MemberVO memberVO)throws Exception{
		return memberMapper.countProduct(memberVO);
	}
	
//	public MemberVO getLogin(MemberVO memberVO)throws Exception{
//	return memberMapper.getLogin(memberVO);
//}
  
	public List<MemberVO> getChatMembers(MemberVO memberVO)throws Exception{
		return memberMapper.getChatMembers(memberVO);
	}

}
