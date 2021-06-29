package com.market.oi.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.oi.member.MemberFileVO;
import com.market.oi.product.ProductVO;



@Service
public class ChatService {

	@Autowired
	private ChatMapper chatMapper;
	
	//Product List
	public List<ChatVO> getProductList(ProductVO productVO) throws Exception {
		System.out.println("프로덕트"+productVO);
		return chatMapper.getProductList(productVO);
	}
	
	//문의자 List
	public List<ChatVO> getBuyerList(ChatVO chatVO) throws Exception {
		
		System.out.println("sellerID : "+chatVO.getSellerID());
		System.out.println("결과값"+chatVO);
		
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
	
	public MemberFileVO getBuyerFileList(ChatVO chatVO) throws Exception {
		return chatMapper.getBuyerFileList(chatVO);
	}
	
	
}
