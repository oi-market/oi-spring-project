package com.market.oi.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	public int memberJoin()throws Exception;
	
	public MemberVO memberLogin()throws Exception;
	
}
