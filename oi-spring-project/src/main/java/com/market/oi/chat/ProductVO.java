package com.market.oi.chat;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductVO {

	private Long num;
	private String title;
	private int categoryNum;
	private Long price;
	private String contents;
	private int sale;
	private Timestamp regDate;
	private String username;
	private String location;
	private Long hit;
	private Long like;
	
	//비교 변수 : 기본값 1 : 판매자
	private int check = 1;
	
}
