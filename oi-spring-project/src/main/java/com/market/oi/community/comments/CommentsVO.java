package com.market.oi.community.comments;

import java.sql.Date;

import com.market.oi.community.CommunityVO;
import com.market.oi.member.MemberFileVO;

import lombok.Data;

@Data
public class CommentsVO {
	
	private Long num;
	private Long communityNum;
	private String writer;
	private String contents;
	private String location;
	private Date regDate;
	private Long ref;
	private Long step;
	private Long depth;
	private String nickName;
	
	private CommunityVO communityVO;
	private MemberFileVO memberFileVO;
}
