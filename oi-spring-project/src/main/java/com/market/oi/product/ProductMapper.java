package com.market.oi.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {

	public List<ProductVO> getProductList()throws Exception;
	public List<ProductVO> getProductSeparatedList(ProductVO productVO)throws Exception;
	
}
