package com.market.oi.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;
	
	public List<ProductVO> getList(ProductVO productVO) throws Exception {
		return myPageMapper.getList(productVO);
	}
	
	public List<ProductVO> getSellList(ProductVO productVO) throws Exception {
		return myPageMapper.getSellList(productVO);
	}
	
	public ProductVO getSelect(ProductVO productVO) throws Exception {
		return myPageMapper.getSelect(productVO);
	}
	
	public int setUpdate(ProductVO productVO) throws Exception {
		return myPageMapper.setUpdate(productVO);
	}
	
	public int sellUpdate(ProductVO productVO) throws Exception {
		return myPageMapper.sellUpdate(productVO);
	}
	
	public int setDelete(ProductVO productVO) throws Exception {
		return myPageMapper.setDelete(productVO);
	}
	
	public List<ProductVO> getBuyList(ProductVO productVO) throws Exception {
		return myPageMapper.getBuyList(productVO);
	}
	
}
