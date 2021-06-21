package com.market.oi.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.oi.member.MemberVO;
import com.market.oi.util.MypagePager;

@Service
public class MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;
	
	public List<ProductVO> getList(MemberVO memberVO) throws Exception {
		/*
		 * pager.makeRow(); long totalCount = myPageMapper.getTotalCount();
		 * pager.makeNum(totalCount);
		 */
		
		return myPageMapper.getList(memberVO);
	}
	
	public List<ProductVO> getSellList(ProductVO productVO) throws Exception {
		return myPageMapper.getSellList(productVO);
	}
	
	public int setHitUpdate(ProductVO productVO) throws Exception {
		return myPageMapper.setHitUpdate(productVO);
	}
	
	public ProductVO getSelect(ProductVO productVO) throws Exception {
		return myPageMapper.getSelect(productVO);
	}
	
	public int setUpdate(ProductVO productVO) throws Exception {
		return myPageMapper.setUpdate(productVO);
	}
	
	public int soldoutUpdate(ProductVO productVO) throws Exception {
		return myPageMapper.soldoutUpdate(productVO);
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
	
	public List<MywishVO> getMywish(MemberVO memberVO) throws Exception {
		return myPageMapper.getMywish(memberVO);
	}
	
	public int setWishInsert(ProductVO productVO) throws Exception {
		return myPageMapper.setWishInsert(productVO);
	}
	
	public int setWishDelete(MywishVO mywishVO) throws Exception {
		return myPageMapper.setWishDelete(mywishVO);
	}
	
	public int likeUpdate(ProductVO productVO) throws Exception {
		return myPageMapper.likeUpdate(productVO);
	}
	
	public int likeDelete(ProductVO productVO) throws Exception {
		return myPageMapper.likeDelete(productVO);
	}
	
	public Long getTotalCount() throws Exception {
		return myPageMapper.getTotalCount();				
	}
	
	public List<ReviewVO> getReview(ReviewVO reviewVO) throws Exception {
		return myPageMapper.getReviewList(reviewVO);
	}
	
	public ReviewVO getReviewSelect(ReviewVO reviewVO) throws Exception {
		return myPageMapper.getReviewSelect(reviewVO);
	}
	
	public List<ReviewVO> getSeller(ReviewVO reviewVO) throws Exception {
		return myPageMapper.getSeller(reviewVO);
	}
	
	public List<ReviewVO> getBuyer(ReviewVO reviewVO) throws Exception {
		return myPageMapper.getBuyer(reviewVO);
	}
}
