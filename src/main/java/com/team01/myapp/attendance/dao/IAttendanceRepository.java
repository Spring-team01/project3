package com.team01.myapp.attendance.dao;

import java.util.List;

import com.team01.myapp.attendance.model.Attendance;

public interface IAttendanceRepository {
	List<Attendance> selectAttendanceList();
	void insertAttendance();
}
