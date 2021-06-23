package com.market.oi.product;

import lombok.Data;

@Data
public class ProductFilesVO {

	private long fileNum;
	private long productNum;
	private String thumbnail;
	private String fileName;
	private String ogName;
}
