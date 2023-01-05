package com.team01.myapp.subattendance.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SubAttendance {
	private int subAttNo;
	private Timestamp subAttTime;
	private Timestamp subleaveTime;
	private String userId;
	private int attNo;
	private String content;
	private String result;
}
