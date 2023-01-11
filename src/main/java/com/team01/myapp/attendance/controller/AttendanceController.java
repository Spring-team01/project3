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
import com.team01.myapp.attendance.model.AttendanceList;
import com.team01.myapp.attendance.service.IAttendanceService;

@Controller
public class AttendanceController {
	static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@Autowired
	IAttendanceService attendanceService;
	
	// 출근
	@RequestMapping("/attendance")
	public String checkAttendance(Attendance attendance, HttpSession session, Model model) {
		Date date = new Date();
		
		// attendance userId 담기
		String userId = (String) session.getAttribute("userId");
		attendance.setUserId(userId);
		
		// 비교하기 위한 날짜 생성
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YYYYMMDD");
		
		String attDate = simpleDateFormat1.format(date);
		
		String choice = attendanceService.selectAtterdanceCheck(attDate, userId);
		
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
		} else if(8 < time && time < 14) {
			// 9시 이후에 출근을 눌렀을 때
			attendance.setStatus("지각");
		} else {
			// 18시 24시까지 시간을 눌렀을 때
			model.addAttribute("message", "너무 늦은 시간에 누르셨습니다. 휴가 신청만 가능합니다.");
			return "/home";
		}
		
		// attendance subjectId 담기
		int subjectId = (Integer) session.getAttribute("subjectId");
		attendance.setSubjectId(subjectId);
		
		// 비교하기 위한 날짜 생성
		SimpleDateFormat updateDateFormat = new SimpleDateFormat("YY/MM/DD");
		String updateDate = updateDateFormat.format(date);
		
		// 그날의 행이 없을 때
		if(choice == null) {
			attendanceService.insertAttendance(attendance);
		
		// 그날의 행이 있을 때 (미출근이거나 휴가 이거나)
		} else {
			if(choice.equals("휴가")) {
				String checkAttTime = attendanceService.selectAttTime(attDate, userId);
				
				if(checkAttTime == null) { 
					
					// 휴가인데 출근 시간이 없는데 출근을 누르는 경우 (조퇴일때)
					attendanceService.updateAttendance(userId, updateDate, choice);
				} else {
					model.addAttribute("message", "이미 출근을 누르셨습니다.");
					return "/home";
				} 
			} else if(choice.equals("미출석")) {
				if(time == 8) {
					choice = "출근";
				} else if((8 < time && time < 14)) {
					choice = "지각";
				} else {
					choice = "출근";
				}
				attendanceService.updateAttendance(userId, updateDate, choice);
			} 
		}
			
		String attTime = attendanceService.selectAttTime(attDate, userId);
		String leaveTime = attendanceService.selectLeaveTime(attDate, userId);
		
		session.setAttribute("attTime", attTime);
		session.setAttribute("leaveTime", leaveTime);
		
		return "/home";
	}
	
	// 퇴근
	@RequestMapping("/leave")
	public String checkOut(HttpSession session, Model model) {
		
		// 비교하기 위한 날짜 생성
		Date date = new Date();
		
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("YY/MM/DD");
		
		// 퇴근 화면을 띄워주기 위한 데이터 타입 형식
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("YYYYMMDD");
		
		String attDate1 = simpleDateFormat1.format(date);
		String attDate2 = simpleDateFormat2.format(date);
		
		// 회원 아이디 불러오기
		String userId = (String) session.getAttribute("userId");
		
		// 행이 있는지 체크 ( 출근을 했는지 안 했는지)
		String choice = attendanceService.selectAtterdanceCheck(attDate2, userId);
		
		// 퇴근을 눌렀는지 확인하기 위한 leaveTime 생성 (null 또는 값이 있음)
		String leaveTime = attendanceService.selectLeaveTime(attDate2, userId);
		
		// 현재 시간 생성
		// 현재 시간 생성
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH");
		int time = Integer.parseInt(timeFormat.format(date));
		
		if(choice != null) {
			if(leaveTime == null) {
				if(time < 18) {
					model.addAttribute("message", "아직 퇴근 시간 전 입니다.");
					return "/home";
				} else {
					attendanceService.updateLeaveCheck(attDate1, userId);
					leaveTime = attendanceService.selectLeaveTime(attDate2, userId);
					session.setAttribute("leaveTime", leaveTime);
				}
			} else {
				model.addAttribute("message", "이미 퇴근을 누르셨습니다.");
				return "/home";
			}
		} else {
			model.addAttribute("message", "아직 출근을 하지 않으셨습니다.");
			return "/home";
		}
		return "/home";
	}
	
	
	@RequestMapping("/attendance/list")
	public String getListAttendance(Model model, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		
		List<AttendanceList> attendanceList = attendanceService.selectOneUserAttendanceList(userId);
		
		model.addAttribute("attendanceList", attendanceList);
		
		return "attendance/userList";
	}
	
	// Home View
	@RequestMapping(value="/attendance/attendanceMiniView")
	public String attendanceMini(Attendance attendance, HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("userId");
		int subjectId = (Integer) session.getAttribute("subjectId");
		
		List<Attendance> list = attendanceService.selectCheck(userId);
		
		String subjectName = attendanceService.selectSubjectName(subjectId);
		
		int attendanceCount = 0;
		int lateCount = 0;
		int vacationCount = 0;
		int AbsenteeismCount = 0;
		
		for(int i=0; i<list.size(); i++) {
			String status = list.get(i).getStatus();
			
			if(status.equals("출근")) {
				attendanceCount ++;
			} else if(status.equals("지각")) {
				lateCount ++;
			} else if(status.equals("휴가")) {
				vacationCount ++;
			} else if(status.equals("결근")) {
				AbsenteeismCount ++;
			}
		}
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("attendanceCount", attendanceCount);
		model.addAttribute("lateCount", lateCount);
		model.addAttribute("vacationCount", vacationCount);
		model.addAttribute("AbsenteeismCount", AbsenteeismCount);
		
		return "attendance/attendanceMiniView";
	}
	
}