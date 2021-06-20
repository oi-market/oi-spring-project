package com.market.oi.community;

import java.sql.Date;
import java.util.List;

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
	private String nickName;
	
	//category의 값 가져오기위함
	private String category;
	
	//files
	private List<CommunityfilesVO> file;

}
