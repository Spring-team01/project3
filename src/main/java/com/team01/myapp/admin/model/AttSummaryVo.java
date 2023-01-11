package com.team01.myapp.admin.model;

import lombok.Data;

@Data
public class AttSummaryVo {
	private int lateSum;//지각
	private int absenceSum;//결근
	private int leaveSum;//휴가
	private int attendanceSum;//출근
	private int yetSum;//미출근
}
