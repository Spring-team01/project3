package com.team01.myapp.attendance.service;

import java.util.Date;
import java.util.List;

import com.team01.myapp.attendance.model.Attendance;

public interface IAttendanceService {
	List<Attendance> selectAttendanceList();
	
	int selectAtterdanceCheck(String attDate, String userId);
	void insertAttendance(Attendance attendance);
	
	void updateLeaveCheck(String attDate, String userId);
	
	String selectAttTime(String today, String userId);
	String selectLeaveTime(String today, String userId);
	
	List<Attendance> selectOneUserAttendanceList(String userId);
}
