package com.market.oi.viewPage;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import com.market.oi.member.MemberVO;



@Mapper
public interface ViewPageMapper {
	

	 public MemberVO getUsername(MemberVO memberVO);
	
	

	


	
}
