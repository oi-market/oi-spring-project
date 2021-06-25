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
	private Long like;
	private Long hit;
	
	private Integer check;
	
}
