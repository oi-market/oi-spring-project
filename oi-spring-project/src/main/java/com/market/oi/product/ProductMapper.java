package com.market.oi.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.market.oi.myPage.MywishVO;



@Mapper
public interface ProductMapper {

	public List<ProductVO> getProductList(Map<String, Object> map)throws Exception;
	public List<ProductVO> getPopularList()throws Exception;
	public Long getTotalCount(Map<String, Object> map)throws Exception;
	public ProductVO getProductSelect(ProductVO productVO)throws Exception;
	public int getProductNum()throws Exception;
	public int setProductInsert(ProductVO productVO)throws Exception;
	public int setFileInsert(ProductFilesVO productFilesVO)throws Exception;
	
	public int setDeleteProduct(ProductVO productVO)throws Exception;
	public int setDeleteFile(ProductFilesVO productFilesVO)throws Exception;
	public List<ProductFilesVO> getFileSelect(ProductFilesVO productFilesVO)throws Exception;
	public ProductFilesVO getFileSelectFromFileNum(ProductFilesVO productFilesVO)throws Exception;
	public int setDeleteFileOne(ProductFilesVO productFilesVO)throws Exception;
	public int setProductUpdate(ProductVO productVO)throws Exception;
	public int setWish(ProductVO productVO)throws Exception;
	public int setHitUpdate(ProductVO productVO) throws Exception;
	public int setWishUp(ProductVO productVO) throws Exception;
	public long getWishExist(ProductVO productVO)throws Exception;
	
}
