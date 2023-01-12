package com.team01.myapp.admin.model;

import lombok.Data;

@Data
public class AttSummaryVo {
	private int lateSum;//지각
	private int absenceSum;//결근
	private int leaveSum;//휴가
	private int attendanceSum;//출근
	private int totalCountBySubject;//전체 인원 수
	private String subjectName;//과목명
	private String userName;//유저 이름

}
