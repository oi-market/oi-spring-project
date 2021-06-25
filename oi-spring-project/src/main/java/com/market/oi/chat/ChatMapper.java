package com.market.oi.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.market.oi.product.ProductVO;

@Mapper
public interface ChatMapper {

	// 로그인 한 아이디의 상품 List
	public List<ChatVO> getProductList(ProductVO productVO) throws Exception;
	
	// 구매 쪽지를 보낸 유저 List
	public List<ChatVO> getBuyerList(ChatVO chatVO) throws Exception;
	
	// 쪽지 List
	public List<ChatVO> getChatList(ChatVO chatVO) throws Exception;
	
	// 선택한 쪽지
	public ChatVO getChatSelect(ChatVO chatVO) throws Exception;
	
	// 쪽지 insert
	public int setChatInsert(ChatVO chatVO) throws Exception;
	
	// 쪽지 delete
	public int setChatDelete(ChatVO chatVO) throws Exception;
	
}
 