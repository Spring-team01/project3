package com.team01.myapp.community.model;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class CommunityComment {
	private int communityCommentNo;
	private DATE communityCommentWriteDate;
	private String userId;
	private String userName;
	private String userEmail;
	private String communityCommentContent;
	private int communityBoardId;
	private int communityCommentReplyNumber;
	private int communityCommentMasterNumber;
	
	private int userFileId;
	private String userFileName;
	private long userFileSize;
	private String userFileContentType;
	private byte[] userFileData;
	private int rnum;
	
	private String rpContent;
	private String rpType;
}
