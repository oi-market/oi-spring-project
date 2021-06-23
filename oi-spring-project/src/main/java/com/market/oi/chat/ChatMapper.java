package com.market.oi.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMapper {

	// 로그인 한 아이디의 상품 List
	public List<ChatVO> getProductList(ProductVO productVO) throws Exception;
	
	// 구매 채팅을 보낸 유저 List
	public List<ChatVO> getBuyerList(ChatVO chatVO) throws Exception;
	
	// 채팅 List
	public List<ChatVO> getChatList(ChatVO chatVO) throws Exception;
	
	// 채팅 insert
	public int setChatInsert(ChatVO chatVO) throws Exception;
	
	// 채팅 delete
	public int setChatDelete(ChatVO chatVO) throws Exception;
	
}
 