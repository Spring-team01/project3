package com.team01.myapp.admin.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Reports {
	private int rpReportNo;
	private int rpBoardId;
	private String rpContent;
	private int rpCommentNo;
	private int rpMasterNo;
	private String rpStatus;
	private String rpType;
	private Date rpWriteDate;
	private String userId;
	private String rpTarget;
}
