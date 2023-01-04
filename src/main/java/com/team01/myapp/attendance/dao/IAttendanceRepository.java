package com.team01.myapp.attendance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.attendance.model.Attendance;

public interface IAttendanceRepository {
	List<Attendance> selectAttendanceList();
	
	int selectAtterdanceCheck(@Param("attDate") String attDate, @Param("uId") String uId);
	void insertAttendance(Attendance attendance);
	
	String selectAttTime(@Param("today") String today, @Param("uId") String uId);
	String selectLeaveTime(@Param("today") String today, @Param("uId") String uId);

	List<Attendance> selectOneUserAttendanceList(String uId);
}
