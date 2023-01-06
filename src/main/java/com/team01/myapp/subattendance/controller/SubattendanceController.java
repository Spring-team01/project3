package com.team01.myapp.subattendance.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.myapp.subattendance.model.SubAttendance;
import com.team01.myapp.subattendance.service.ISubAttendanceService;

@Controller
public class SubattendanceController {
	static final Logger logger = LoggerFactory.getLogger(SubattendanceController.class);
	
	
	@Autowired
	ISubAttendanceService subAttendanceService;
	
	// 공결 list
	@RequestMapping("/subattendance")
	public String subAttendanceList() {
		return "/subattendance/write";
	}
	
	@RequestMapping(value="/subattendance/write", method=RequestMethod.POST)
	public String writeSubAttendance(HttpSession session, SubAttendance subAttendance, BindingResult result, 
			RedirectAttributes redirectAttrs, String date,
			String subAttTime, String subLeaveTime) {
		
		// 타임 스탬프에 들어갈 수 있는 형식으로 변경 (년도는 희율이 누나 생일임)
		String subAttTime1 = "1994-05-17 " + subAttTime +":00";
		String subLeaveTime1 = "1994-05-17 " + subLeaveTime +":00";
		
		// 타임 스탬프 형식으로 변경 String -> Timestamp
		Timestamp subAttTimestamp = Timestamp.valueOf(subAttTime1);
		Timestamp subLeaveTimestamp = Timestamp.valueOf(subLeaveTime1);
		
		// userId String 타입으로 변경
		String userId = (String) session.getAttribute("userId");
		
		// attNo를 얻어내기 위해 Date 날짜 사용
		Date todayDate = new Date();
		SimpleDateFormat todayFormat = new SimpleDateFormat("YYYYMMDD");
		String today = todayFormat.format(todayDate);
		int attNo = subAttendanceService.selectAttNo(today, userId);
		
		subAttendance.setSubAttTime(subAttTimestamp);
		subAttendance.setSubleaveTime(subLeaveTimestamp);
		subAttendance.setUserId(userId);
		subAttendance.setAttNo(attNo);
		
		System.out.println("date : " + date);
		System.out.println("subAttTimestamp : " + subAttTimestamp);
		System.out.println("subLeaveTimestamp : " + subLeaveTimestamp);
		System.out.println("userId : " + userId);
		System.out.println("/subattendamce/write : " + subAttendance.toString());
		
		
		
		return "/subattendance/list";
	}
}
