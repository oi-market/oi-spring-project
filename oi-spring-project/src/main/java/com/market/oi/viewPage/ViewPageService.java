package com.market.oi.viewPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.oi.member.MemberVO;

@Service
public class ViewPageService {
	
	@Autowired
	public ViewPageMapper viewPageMapper;

	public MemberVO getUsername(MemberVO memberVO) throws Exception{
		return viewPageMapper.getUsername(memberVO);
	}
	
}
