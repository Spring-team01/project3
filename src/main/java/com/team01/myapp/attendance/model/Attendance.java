package com.team01.myapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Attendance {
	private int attNo;
	private Date attDate;
	private Timestamp attTime;
	private Timestamp leaveTime;
	private String status;
	private String userId;
	private int subjectId;
}