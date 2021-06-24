package com.market.oi.chat;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatVO {
	
	private Long num;
	private Long productNum;
	private String sellerID;
	private String buyerID;
	private String contents;
	private Timestamp regDate;
	private String productTitle;
	private String sellerName;
	private String buyerName;
	private String senderID;
	private String receiverID;
	
	//비교 변수 : 기본값 1 : 판매자
	private int check = 1;

}
