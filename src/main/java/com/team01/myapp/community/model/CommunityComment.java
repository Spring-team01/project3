package com.team01.myapp.community.model;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class CommunityComment {
	private int communityCommentNo;
	private DATE communityCommentWriteDate;
	private String userId;
	private String communityCommentContent;
	private int communityBoardId;
	private int communityCommentReplyNumber;
	private int communityCommentMasterNumber;
	
}
