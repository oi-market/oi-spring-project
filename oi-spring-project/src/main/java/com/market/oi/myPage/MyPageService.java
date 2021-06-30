package com.market.oi.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.market.oi.community.CommunityVO;

import com.market.oi.community.comments.CommentsVO;


import com.market.oi.community.comments.CommentsVO;

import com.market.oi.member.MemberVO;
import com.market.oi.util.MypagePager;

@Service
public class MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;
	
	public List<PFileVO> getList(MemberVO memberVO) throws Exception {
		return myPageMapper.getList(memberVO);
	}
	
	public List<PFileVO> getSellList(MemberVO memberVO) throws Exception {
		return myPageMapper.getSellList(memberVO);
	}
	
	public List<PWishVO> getMywish(MemberVO memberVO) throws Exception {
		return myPageMapper.getMywish(memberVO);
	}
	
	public List<OrderPFileVO> getBuyList(MemberVO memberVO) throws Exception {
		return myPageMapper.getBuyList(memberVO);
	}
	
	public int setHitUpdate(ProductVO productVO) throws Exception {
		return myPageMapper.setHitUpdate(productVO);
	}
	
	public ProductVO getSelect(ProductVO productVO) throws Exception {
		return myPageMapper.getSelect(productVO);
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
	
	public int setWishInsert(ProductVO productVO) throws Exception {
		return myPageMapper.setWishInsert(productVO);
	}
	
	public int setWishDelete(MywishVO mywishVO) throws Exception {
		return myPageMapper.setWishDelete(mywishVO);
	}
	
	public int likeUpdate(ProductVO productVO) throws Exception {
		return myPageMapper.likeUpdate(productVO);
	}
	
	public int likeDelete(MywishVO mywishVO) throws Exception {
		return myPageMapper.likeDelete(mywishVO);
	}
	
	public Long getTotalCount() throws Exception {
		return myPageMapper.getTotalCount();				
	}
	
	public List<ReviewVO> getReviewList(MemberVO memberVO) throws Exception {
		return myPageMapper.getReviewList(memberVO);
	}
	
	public List<ReviewVO> getMyReview(MemberVO memberVO) throws Exception{
		return myPageMapper.getMyReview(memberVO);
	}
	
	public ReviewVO getReviewSelect(ReviewVO reviewVO) throws Exception {
		return myPageMapper.getReviewSelect(reviewVO);
	}
	
	public List<ReviewVO> getSeller(MemberVO memberVO) throws Exception {
		return myPageMapper.getSeller(memberVO);
	}
	
	public List<ReviewVO> getBuyer(MemberVO memberVO) throws Exception {
		return myPageMapper.getBuyer(memberVO);
	}
	
	public int setReview(ReviewVO reviewVO) throws Exception {
		return myPageMapper.setReview(reviewVO);
	}
	
	public ProductVO reviewInsert(ProductVO productVO) throws Exception {
		return myPageMapper.reviewInsert(productVO);
	}
	

	public List<CommentsVO> getComment(CommentsVO commentsVO) throws Exception{
		return myPageMapper.getComment(commentsVO);
	}
	
	public List<CommunityVO> getcommunity(CommunityVO communityVO) throws Exception{
		return myPageMapper.getcommunity(communityVO);
	}
	

	public List<CommunityVO> getVillage(MemberVO memberVO) throws Exception {
		return myPageMapper.getVillage(memberVO);
	}
	

	public Long countReview(MemberVO memberVO) throws Exception{
		return myPageMapper.countReview(memberVO);
	}
	
	public Long countSeller(MemberVO memberVO) throws Exception {
		return myPageMapper.countSeller(memberVO);
	}
	
	public Long countBuyer(MemberVO memberVO) throws Exception {
		return myPageMapper.countBuyer(memberVO);
	}
	
	public Long countComments(CommentsVO commentsVO) throws Exception {
		return myPageMapper.countComments(commentsVO);
	}


}
