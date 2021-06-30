package com.market.oi.myPage;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {

	private Long num;
	private String title;
	private Long categoryNum;
	private String price;
	private String contents;
	private int sale;
	private Date regDate;
	private String username;
	private String location;
	private Long hit;
	private Long wish;
	
}
