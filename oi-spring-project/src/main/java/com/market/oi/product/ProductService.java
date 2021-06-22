package com.market.oi.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

	@Autowired
	ProductMapper productMapper;
	
	public List<ProductVO> getProductList()throws Exception{
		
		 List<ProductVO> ar = productMapper.getProductList();
		
		return ar;
	}
	
	
}
