package com.team01.myapp.attendance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.attendance.model.Attendance;
import com.team01.myapp.attendance.model.AttendanceList;

public interface IAttendanceRepository {
	List<Attendance> selectAttendanceList();
	
	String selectAtterdanceCheck(@Param("attDate") String attDate, @Param("userId") String userId);
	void insertAttendance(Attendance attendance);
	
	void updateAttendance(@Param("userId") String userId, @Param("attDate") String attDate, @Param("choice") String choice);
	
	void updateLeaveCheck(@Param("attDate") String attDate, @Param("userId") String userId);
	
	String selectAttTime(@Param("today") String today, @Param("userId") String userId);
	String selectLeaveTime(@Param("today") String today, @Param("userId") String userId);

	List<AttendanceList> selectOneUserAttendanceList(String userId);
	
	List<Attendance> selectCheckOutAttNo(String today);
	
	List<Attendance> selectCheckOutAttNo2(String today);
	
	void updateCheckOut(int attNo);
	
	List<Attendance> selectCheckOutAttNoSubjectId(String today);
	
	void insertCheckOut(@Param("userId") String userId, @Param("subjectId") int subjcetId);
	
	List<Attendance> selectCheck(String userId);
	
	String selectSubjectName(int subjectId);
}
