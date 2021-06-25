package com.market.oi.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ChatService {

	@Autowired
	private ChatMapper chatMapper;
	
	//Product List
	public List<ChatVO> getProductList(ProductVO productVO) throws Exception {
		return chatMapper.getProductList(productVO);
	}
	
	//문의자 List
	public List<ChatVO> getBuyerList(ChatVO chatVO) throws Exception {
		
		System.out.println("sellerID : "+chatVO.getSellerID());
		
		return chatMapper.getBuyerList(chatVO);
	}
	
	//쪽지 List
	public List<ChatVO> getChatList(ChatVO chatVO) throws Exception {
		return chatMapper.getChatList(chatVO);
	}
	
	//쪽지 Select
	public ChatVO getChatSelect(ChatVO chatVO) throws Exception {
		return chatMapper.getChatSelect(chatVO);
	}
	
	//쪽지 insert
	public int setChatInsert(ChatVO chatVO) throws Exception {
		return chatMapper.setChatInsert(chatVO);
	}
	
	//쪽지 delete
	public int setChatDelete(ChatVO chatVO) throws Exception {
		return chatMapper.setChatDelete(chatVO);
	}
	
	
	
}
