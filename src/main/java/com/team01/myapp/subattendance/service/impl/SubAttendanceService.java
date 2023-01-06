package com.team01.myapp.subattendance.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.myapp.subattendance.dao.ISubAttendanceRepository;
import com.team01.myapp.subattendance.service.ISubAttendanceService;

@Service
public class SubAttendanceService implements ISubAttendanceService {
	
	@Autowired
	ISubAttendanceRepository SubAttendanceRepository;
	
	@Override
	public int selectAttNo(String today, String userId) {
		return SubAttendanceRepository.selectAttNo(today, userId);
	}
}
