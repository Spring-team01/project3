package com.team01.myapp.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardComment {
	private int bcReplyNo;
	private String bcContent;
	private Date bcWriteDate;
	private String userId;
	private int boardId;
	private int bcMasterNo;
	private int bcReplyStep;
	private int userFileId;
	
}

