package com.market.oi.product;

import java.sql.Date;
import java.util.List;

import com.market.oi.member.MemberVO;

import lombok.Data;

@Data
public class ProductVO {

	private long num;
	private String title;
	private Integer categoryNum;
	private String price;
	private String contents;
	private int sale;
	private Date regDate;
	private String username;
	private String location;
	private long hit;
	private long like;
	
	
	private List<ProductFilesVO> productFiles;
	private List<MemberVO> members;
	
	//쪽지 판매자와 구매자를 비교하기 위한 변수 : db에 값 안들어감!
	private Integer check = 1;
}
