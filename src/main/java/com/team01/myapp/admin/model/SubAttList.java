package com.team01.myapp.admin.model;

import java.sql.Date;

import lombok.Data;

@Data
public class SubAttList {
	private int subAttNo;
	private String userId;
	private String userName;
	private String title;
	private Date writeDate;
	private String result;
	private String subStatus;
	
}
