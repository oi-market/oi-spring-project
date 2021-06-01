package com.market.oi.community;

import java.sql.Date;

import lombok.Data;

@Data
public class CommunityVO {
	
	private Long num;
	//기본값 0L로 설정
	private Long categoryNum = 0L;
	private String contents;
	private String writer;
	private String location;
	private Date regDate;
	private Long like;
	
	//category의 값 가져오기위함
	private String category;

}
