package com.team01.myapp.attendance.service;

import java.util.List;

import com.team01.myapp.attendance.model.Attendance;
import com.team01.myapp.attendance.model.AttendanceList;

public interface IAttendanceService {
	List<Attendance> selectAttendanceList();
	
	String selectAtterdanceCheck(String attDate, String userId);
	void insertAttendance(Attendance attendance);
	
	void updateAttendance(String userId, String attDate, String choice);
	
	void updateLeaveCheck(String attDate, String userId);
	
	String selectAttTime(String today, String userId);
	String selectLeaveTime(String today, String userId);
	
	List<AttendanceList> selectOneUserAttendanceList(String userId);
	
	void checkOut(String today);
	
	void checkOut2(String today);
	
	List<Attendance> selectCheck(String userId);
	
	String selectSubjectName(int subjectId);
	
	void ex();
}
