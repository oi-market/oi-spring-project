package com.market.oi.community.comments;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentsVO {
	
	private Long num;
	private Long communityNum;
	private String writer;
	private String contents;
	private String location;
	private Date regDate;
	private Long like;
	private Long ref;
	private Long step;
	private Long depth;

}
