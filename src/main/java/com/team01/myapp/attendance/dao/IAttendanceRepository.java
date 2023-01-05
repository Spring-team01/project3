package com.team01.myapp.attendance.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.attendance.model.Attendance;

public interface IAttendanceRepository {
	List<Attendance> selectAttendanceList();
	
	int selectAtterdanceCheck(@Param("attDate") String attDate, @Param("userId") String userId);
	void insertAttendance(Attendance attendance);
	
	void updateLeaveCheck(@Param("attDate") String attDate, @Param("userId") String userId);
	
	String selectAttTime(@Param("today") String today, @Param("userId") String userId);
	String selectLeaveTime(@Param("today") String today, @Param("userId") String userId);

	List<Attendance> selectOneUserAttendanceList(String userId);
}
