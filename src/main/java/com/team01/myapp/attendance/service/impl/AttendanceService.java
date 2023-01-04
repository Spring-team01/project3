package com.team01.myapp.attendance.service.impl;

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
	public int selectAtterdanceCheck(String attDate, String uId) {
		return AttendanceRepository.selectAtterdanceCheck(attDate, uId);
	}
	
	@Override
	public String selectAttTime(String today, String uId) {
		return AttendanceRepository.selectAttTime(today, uId);
	}
	
	@Override
	public String selectLeaveTime(String today, String uId) {
		return AttendanceRepository.selectLeaveTime(today, uId);
	}
	
	@Override
	public List<Attendance> selectOneUserAttendanceList(String uId) {
		return AttendanceRepository.selectOneUserAttendanceList(uId);
	}

}
