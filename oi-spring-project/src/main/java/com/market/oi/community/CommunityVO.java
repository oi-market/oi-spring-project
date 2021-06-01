package com.market.oi.community;

import java.sql.Date;

import lombok.Data;

@Data
public class CommunityVO {
	
	private Long num;
	private String categoryNum;
	private String contents;
	private String writer;
	private String location;
	private Date regDate;
	private Long like;

}
