package com.team01.myapp.attendance.service;

import java.util.List;

import com.team01.myapp.attendance.model.Attendance;

public interface IAttendanceService {
	List<Attendance> selectAttendanceList();
	
	String selectAtterdanceCheck(String attDate, String userId);
	void insertAttendance(Attendance attendance);
	
	void updateAttendance(String userId, String attDate, String choice);
	
	void updateLeaveCheck(String attDate, String userId);
	
	String selectAttTime(String today, String userId);
	String selectLeaveTime(String today, String userId);
	
	List<Attendance> selectOneUserAttendanceList(String userId);
}
