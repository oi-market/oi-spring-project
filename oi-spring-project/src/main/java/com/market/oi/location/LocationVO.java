package com.market.oi.location;

import java.util.List;

import com.market.oi.member.MemberVO;

import lombok.Data;

@Data
public class LocationVO {

	private String location;
	private Double wgs84X;
	private Double wgs84Y;

	private List<MemberVO> members;
//	private List<ProductVO> products;
//	private List<CommentsVO> comments;
//	private List<CommunityVO> communities;
	
}
