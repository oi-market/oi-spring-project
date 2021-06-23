package com.market.oi.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {

	public List<ProductVO> getProductList()throws Exception;
	public List<ProductVO> getProductSeparatedList(ProductVO productVO)throws Exception;
	public ProductVO getProductSelect(ProductVO productVO)throws Exception;
	public int getProductNum()throws Exception;
	public int setProductInsert(ProductVO productVO)throws Exception;
	public int setFileInsert(ProductFilesVO productFilesVO)throws Exception;
}
