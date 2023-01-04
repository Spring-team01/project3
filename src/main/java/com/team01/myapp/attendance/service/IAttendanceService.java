package com.team01.myapp.attendance.service;

import java.util.List;

import com.team01.myapp.attendance.model.Attendance;

public interface IAttendanceService {
	List<Attendance> selectAttendanceList();
	
	int selectAtterdanceCheck(String attDate, String uId);
	void insertAttendance(Attendance attendance);
	
	String selectAttTime(String today, String uId);
	String selectLeaveTime(String today, String uId);
	
	List<Attendance> selectOneUserAttendanceList(String uId);
}
