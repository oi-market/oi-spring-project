package com.market.oi.myPage;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int num;
	private Long productNum;
	private String writer;
	private String reciver;
	private String contents;
	private Date regDate;
	private double score;
	private String writerPosition;
	
}
