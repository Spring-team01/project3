package com.team01.myapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class AttendanceList {
	private Date attDate;
	private String attTime;
	private String leaveTime;
	private String status;
}
