package com.market.oi.community.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.oi.chat.ChatVO;
import com.market.oi.member.MemberFileVO;

@Service
public class CommentsService {
	
	@Autowired
	private CommentsMapper commentsMapper;
	
	public List<CommentsVO> getList(CommentsVO commentsVO) throws Exception{
		return commentsMapper.getList(commentsVO);
	}
	
	public CommentsVO getSelect(CommentsVO commentsVO) throws Exception{
		
		return commentsMapper.getSelect(commentsVO);
	}
	
	public int setInsert(CommentsVO commentsVO) throws Exception{
		//communityNum = 게시글의 글번호
		//num = 부모댓글의 글번호
		
		System.out.println("communityNum : "+commentsVO.getCommunityNum());
		System.out.println("num : "+commentsVO.getNum());
		
//		commentsVO.setWriter("username1");
//		commentsVO.setLocation("마포구");
		
		CommentsVO parents = new CommentsVO();
		if(commentsVO.getNum() == null) {
			parents.setCommunityNum(commentsVO.getCommunityNum());
			parents.setStep(0L);
			parents.setDepth(0L);
			commentsVO.setStep(0L);
			commentsVO.setDepth(0L);
		} else {
			//db에서 댓글의 글번호를 조회
			
			parents = commentsMapper.getSelect(commentsVO);
			System.out.println("num2:"+commentsVO.getNum());
			System.out.println("parents_step2:"+parents.getStep());
			//commentsVO 가져오기(step, depth)
			commentsVO.setNum(0L);
		}
		
	
		
		//1.step update
		//communityNum 이 같고, step이 조회한 step보다 큰것들을 조회해서 update
		//step = step+1
		int result = commentsMapper.stepUpdate(parents);
		
		//2. insert
		//조회한 step+1, 조회한 depth+1
		//insert 하러가기
		System.out.println("parents_step"+parents.getStep()+1);
		commentsVO.setStep(parents.getStep()+1);
		commentsVO.setDepth(parents.getDepth()+1);
		
		
		return commentsMapper.setInsert(commentsVO);
	}
	
	
	
	public int setDelete(CommentsVO commentsVO) throws Exception{
		
		int result = commentsMapper.setDelete(commentsVO);
		
		System.out.println("comments service result : "+result);
		
		return result;
	}
	
	public int setUpdate(CommentsVO commentsVO) throws Exception{
		return commentsMapper.setUpdate(commentsVO);
	}
	
	public int setReply(CommentsVO commentsVO) throws Exception{
		
		System.out.println("getnum : "+commentsVO.getNum());
		
		//부모글의 ref, step depth 조회
		CommentsVO parent = commentsMapper.getSelect(commentsVO);
		System.out.println("service ref : "+parent.getRef());
		System.out.println("service step : "+parent.getStep());
		System.out.println("service depth : "+parent.getDepth());
		
		commentsVO.setRef(parent.getRef());
		commentsVO.setStep(parent.getStep()+1);
		commentsVO.setDepth(parent.getDepth()+1);
		
		int result = commentsMapper.setReplyUpdate(parent);
		result = commentsMapper.setReply(commentsVO);
		
		return result;
	}
	
	public Long getTotalCount(CommentsVO commentsVO) throws Exception{
		return commentsMapper.getTotalCount(commentsVO);
	}

	public MemberFileVO getCommentsFile(CommentsVO commentsVO) throws Exception {
		return commentsMapper.getCommentsFile(commentsVO);
	}
	
}
