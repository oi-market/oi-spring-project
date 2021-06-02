package com.market.oi.member;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberMapper {
	

	
	public int setMemberRole(Map<String, String> map)throws Exception;
	
	public int memberJoin(MemberVO memberVO)throws Exception;
	
	public MemberVO getUsername(MemberVO memberVO)throws Exception;
	

	
//	public int setJoinFile(MemberFileVO memberFileVO)throws Exception;

	
}
