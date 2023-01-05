package com.team01.myapp.attendance.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.myapp.attendance.dao.IAttendanceRepository;
import com.team01.myapp.attendance.model.Attendance;
import com.team01.myapp.attendance.service.IAttendanceService;

@Service
public class AttendanceService implements IAttendanceService {
	
	@Autowired
	IAttendanceRepository AttendanceRepository;
	
	@Override
	public List<Attendance> selectAttendanceList() {
		return AttendanceRepository.selectAttendanceList();
	}
	
	@Override
	public void insertAttendance(Attendance attendance) {
		AttendanceRepository.insertAttendance(attendance);
	}
	
	@Override
	public int selectAtterdanceCheck(String attDate, String userId) {
		return AttendanceRepository.selectAtterdanceCheck(attDate, userId);
	}
	
	@Override
	public String selectAttTime(String today, String userId) {
		return AttendanceRepository.selectAttTime(today, userId);
	}
	
	@Override
	public String selectLeaveTime(String today, String userId) {
		return AttendanceRepository.selectLeaveTime(today, userId);
	}
	
	@Override
	public List<Attendance> selectOneUserAttendanceList(String userId) {
		return AttendanceRepository.selectOneUserAttendanceList(userId);
	}

	@Override
	public void updateLeaveCheck(String attDate, String userId) {
		AttendanceRepository.updateLeaveCheck(attDate, userId);
	}
	
}
