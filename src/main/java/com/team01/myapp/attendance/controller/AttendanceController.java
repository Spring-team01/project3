package com.team01.myapp.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	IAttendanceService attendanceService;
	
	@RequestMapping("/attendance")
	public String checkAttendance(Attendance attendance, HttpSession session, Model model) {
		Date date = new Date();
		
		// attendance uId 담기
		String uId = (String) session.getAttribute("uId");
		attendance.setUId(uId);
		
		// 비교하기 위한 날짜 생성
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMDD");
		
		String attDate = simpleDateFormat1.format(date);
		
		int choice = attendanceService.selectAtterdanceCheck(attDate, uId);
		if(choice == 1) {
			model.addAttribute("message", "이미 출근을 누르셨습니다.");
			return "/home";
		} else {
			
			// 현재 시간 생성
			SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("HH");
			int time = Integer.parseInt(simpleDateFormat2.format(date));
			
			// 시간에 따른 status attendance에 추가
			if(time == 8) {
				// 8시 안에 출근을 눌렀을 때
				attendance.setStatus("출근");
			} else if (time < 8) {
				// 8시 전에 출근을 눌렀을 때
				model.addAttribute("message", "아직 출근 시간 전입니다. 8시 이후에 눌러주세요.");
				return "/home";
			} else if(8 < time && time < 18) {
				// 18시 이후에 출근을 눌렀을 때
				attendance.setStatus("지각");
			} else {
				// 18시 24시까지 시간을 눌렀을 때
				model.addAttribute("message", "너무 늦은 시간에 누르셨습니다. ㅠㅠ");
				return "/home";
			}
			
			// attendance subjectId 담기
			int subjectId = (Integer) session.getAttribute("subjectId");
			attendance.setSubjectId(subjectId);
			
			attendanceService.insertAttendance(attendance);
			
			String attTime = attendanceService.selectAttTime(attDate, uId);
			String leaveTime = attendanceService.selectLeaveTime(attDate, uId);
			
			session.setAttribute("attTime", attTime);
			session.setAttribute("leaveTime", leaveTime);
			
			return "/home";
			
		}
	}
	
	@RequestMapping("/attendance/list")
	public String getListAttendance(Model model) {
		
		List<Attendance> attendanceList = attendanceService.selectAttendanceList();
		
		model.addAttribute("attendanceList", attendanceList);
		
		return "attendance/userList";
	}
	
}
