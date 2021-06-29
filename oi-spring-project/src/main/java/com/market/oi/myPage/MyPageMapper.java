package com.market.oi.myPage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.market.oi.community.CommunityVO;
import com.market.oi.member.MemberVO;
import com.market.oi.util.MypagePager;

@Mapper
public interface MyPageMapper {

	public List<PFileVO> getList(MemberVO memberVO);
	
	public List<PFileVO> getSellList(MemberVO memberVO);
	
	public List<PWishVO> getMywish(MemberVO memberVO);
	
	public List<OrderPFileVO> getBuyList(MemberVO memberVO) throws Exception;
	
	public int setHitUpdate(ProductVO productVO) throws Exception;
	
	public ProductVO getSelect(ProductVO productVO) throws Exception;
	
	public int soldoutUpdate(ProductVO productVO) throws Exception;
	
	public int sellUpdate(ProductVO productVO) throws Exception;
	
	public int setDelete(ProductVO productVO) throws Exception;
	
	public int setWishInsert(ProductVO productVO) throws Exception;
	
	public int setWishDelete(MywishVO mywishVO) throws Exception;
	
	public int likeUpdate(ProductVO productVO) throws Exception;
	
	public int likeDelete(MywishVO mywishVO) throws Exception;
	
	public Long getTotalCount() throws Exception;
	
	public List<ReviewVO> getReviewList(MemberVO memberVO) throws Exception;
	
	public List<ReviewVO> getMyReview(MemberVO memberVO) throws Exception;
	
	public ReviewVO getReviewSelect(ReviewVO reviewVO) throws Exception;
	
	public List<ReviewVO> getSeller(MemberVO memberVO) throws Exception;
	
	public List<ReviewVO> getBuyer(MemberVO memberVO) throws Exception;
	
	public int setReview(ReviewVO reviewVO) throws Exception;
	
	public ProductVO reviewInsert(ProductVO productVO) throws Exception;
	
	public List<CommunityVO> getVillage(MemberVO memberVO) throws Exception;
	
	public Long countReview(MemberVO memberVO);
	
	public Long countSeller(MemberVO memberVO);
	
	public Long countBuyer(MemberVO memberVO);
}
