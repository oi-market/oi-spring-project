package com.market.oi.myPage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageMapper {

	public List<ProductVO> getList(ProductVO productVO);
	
	public List<ProductVO> getSellList(ProductVO productVO);
	
	public int setHitUpdate(ProductVO productVO) throws Exception;
	
	public ProductVO getSelect(ProductVO productVO) throws Exception;
	
	public int setUpdate(ProductVO productVO) throws Exception;
	
	public int sellUpdate(ProductVO productVO) throws Exception;
	
	public int setDelete(ProductVO productVO) throws Exception;
	
	public List<ProductVO> getBuyList(ProductVO productVO) throws Exception;
	
	public List<MywishVO> getMywish(MywishVO mywishVO) throws Exception;
	
	public int setWishInsert(ProductVO productVO) throws Exception;
	
	public int setWishDelete(MywishVO mywishVO) throws Exception;
	
}
