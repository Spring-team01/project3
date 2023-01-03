package com.team01.myapp.attendance.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.myapp.attendance.model.Attendance;
import com.team01.myapp.attendance.service.IAttendanceService;

@Controller
public class AttendanceController {
	static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@Autowired
	IAttendanceService AttendanceService;
	
	@RequestMapping("/list")
	public String getListAttendance(Model model) {
		
		List<Attendance> attendanceList = AttendanceService.selectAttendanceList();
		
		model.addAttribute("attendanceList", attendanceList);
		
		return "attendance/list";
	}
	
	@RequestMapping("/attendance/list")
	public String checkAttendance() {
		return "redirect:/" ;
	}
	
}
