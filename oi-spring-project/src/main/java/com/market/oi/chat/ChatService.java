package com.market.oi.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {

	@Autowired
	private ChatMapper chatMapper;
	
	//Product List
	public List<ChatVO> getProductList(ProductVO productVO) throws Exception{
		return chatMapper.getProductList(productVO);
	}
	
	//Buyer List
	public List<ChatVO> getBuyerList(ChatVO chatVO) throws Exception{
		return chatMapper.getBuyerList(chatVO);
	}
	
	//Chat List
	public List<ChatVO> getChatList(ChatVO chatVO) throws Exception{
		return chatMapper.getChatList(chatVO);
	}
	
	//Chat insert
	public int setChatInsert(ChatVO chatVO) throws Exception{
		return chatMapper.setChatInsert(chatVO);
	}
	
	//Chat delete
	public int setChatDelete(ChatVO chatVO) throws Exception{
		return chatMapper.setChatDelete(chatVO);
	}
	
	
	
}
