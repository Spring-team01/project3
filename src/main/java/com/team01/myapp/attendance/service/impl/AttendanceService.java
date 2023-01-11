package com.team01.myapp.attendance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.myapp.attendance.dao.IAttendanceRepository;
import com.team01.myapp.attendance.model.Attendance;
import com.team01.myapp.attendance.model.AttendanceList;
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
	public String selectAtterdanceCheck(String attDate, String userId) {
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
	public List<AttendanceList> selectOneUserAttendanceList(String userId) {
		return AttendanceRepository.selectOneUserAttendanceList(userId);
	}

	@Override
	public void updateLeaveCheck(String attDate, String userId) {
		AttendanceRepository.updateLeaveCheck(attDate, userId);
	}

	@Override
	public void updateAttendance(String userId, String attDate, String choice) {
		AttendanceRepository.updateAttendance(userId, attDate, choice);
	}
	
	@Transactional
	public void checkOut(String today) {
		
		List<Attendance> list = AttendanceRepository.selectCheckOutAttNo(today);
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("update attNo : " + list.get(i).getAttNo());
			AttendanceRepository.updateCheckOut(list.get(i).getAttNo());
		}
		
		list = AttendanceRepository.selectCheckOutAttNoSubjectId(today);
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("insert userId : " + list.get(i).getUserId());
			System.out.println("insert subjectId : " + list.get(i).getSubjectId());
			AttendanceRepository.insertCheckOut(list.get(i).getUserId(), list.get(i).getSubjectId());
		}
	}
	
	@Override
	public void checkOut2(String today) {
		List<Attendance> list = AttendanceRepository.selectCheckOutAttNo2(today);
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("update attNo : " + list.get(i).getAttNo());
			AttendanceRepository.updateCheckOut(list.get(i).getAttNo());
		}
	}

	@Override
	public List<Attendance> selectCheck(String userId) {
		return AttendanceRepository.selectCheck(userId);
	}

	@Override
	public String selectSubjectName(int subjectId) {
		return AttendanceRepository.selectSubjectName(subjectId);
	}
	
}
