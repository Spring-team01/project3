package com.team01.myapp.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.team01.myapp.attendance.service.IAttendanceService;

@Component
public class AttendanceScheduler {
	@Autowired
	IAttendanceService attendanceService;

	// 23시 59분에 결근으로 학생 추가
	//@Scheduled(cron = "0 00 18 * * 1-7")
	public void getStudentStatus() {
		Date date = new Date();

		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

		String today = format.format(date);

		attendanceService.checkOut(today);
	}

	@Scheduled(cron = "0 59 23 * * 1-5")
	public void getStudentStatus2() {
		Date date = new Date();

		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

		String today = format.format(date);

		attendanceService.checkOut2(today);
	}

//	@Scheduled(cron = "* * * * * *")
//	public void ex() {
//		attendanceService.ex();
//	}

}
