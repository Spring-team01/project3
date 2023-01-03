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

}
