package com.team01.myapp.admin.model;

import lombok.Data;

@Data
public class AttSumDailyVo {
	private String subjectName;//과목명
	private String userName;//유저 이름
	private String attTime;//출근시간
	private String leaveTime;//퇴근시간
	private String status;//출근상태
	
}
