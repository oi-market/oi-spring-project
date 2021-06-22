package com.market.oi.product;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {

	private long num;
	private String title;
	private Integer categoryNum;
	private long price;
	private String contents;
	private int sale;
	private Date regDate;
	private String username;
	private String location;
	private long hit;
	private long like;
	
	
	private List<ProductFilesVO> productFiles;
	
}
