package com.market.oi.community;

import lombok.Data;

@Data
public class CommunityVO {
	
	private Long num;
	private String subject;
	private String contents;
	private String writer;
	private String location;
	private Long like;

}
