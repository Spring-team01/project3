package com.team01.myapp.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Reports {
	private int rpReportNo;
	private int rpBoardNo;
	private String rpContent;
	private int rpCommentNo;
	private int rpMasterNo;
	private String rpStatus;
	private String rpType;
	private Date rpWriteDate;
	private String userId;
}
