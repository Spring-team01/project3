package com.team01.myapp.subattendance.model;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

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
	private String subAttendanceTitle;
	private Date subAttDate;
	private String subStatus;
	
	private MultipartFile file;
}
