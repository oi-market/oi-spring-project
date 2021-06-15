package com.market.oi.member;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface MemberMapper {
	

	
	public int setMemberRole(Map<String, String> map)throws Exception;
	
	public int memberJoin(MemberVO memberVO)throws Exception;
	
	public MemberVO getUsername(MemberVO memberVO)throws Exception;
	
	 public MemberVO memberLogin(MemberVO memberVO);
	 
	public MemberVO memberFindID(MemberVO memberVO);
	
	public MemberVO memberFindPW(MemberVO memberVO);
	
	public int memberUpdatePW(MemberVO memberVO);
	
	public int memberUpdate(MemberVO memberVO);
	
	public int memberDelete(MemberVO memberVO);
	
	public MemberVO memberPWCheck(MemberVO memberVO);
	
	public MemberVO memberPWChange(MemberVO memberVO);
	
	
	
//	public int setJoinFile(MemberFileVO memberFileVO)throws Exception;

	
}
