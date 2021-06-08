package com.market.oi.myPage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageMapper {

	public List<ProductVO> getList(ProductVO productVO);
	
	public List<ProductVO> getSellList(ProductVO productVO);
	
	public ProductVO getSelect(ProductVO productVO) throws Exception;
	
	public int setUpdate(ProductVO productVO) throws Exception;
	
	public int sellUpdate(ProductVO productVO) throws Exception;
	
	public int setDelete(ProductVO productVO) throws Exception;
	
	public List<ProductVO> getBuyList(ProductVO productVO) throws Exception;
	
}
