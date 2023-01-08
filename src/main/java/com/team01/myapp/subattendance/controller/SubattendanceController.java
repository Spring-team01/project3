package com.team01.myapp.subattendance.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.myapp.subattendance.model.SubAttFile;
import com.team01.myapp.subattendance.model.SubAttendance;
import com.team01.myapp.subattendance.service.ISubAttendanceService;
import com.team01.myapp.util.Pager;

@Controller
public class SubattendanceController {
	static final Logger logger = LoggerFactory.getLogger(SubattendanceController.class);
	
	
	@Autowired
	ISubAttendanceService subAttendanceService;
	
	// 휴가 list 불러오기
	@RequestMapping(value="/subattendance/{pageNo}", method = RequestMethod.GET)
	public String subAttendanceList(@PathVariable String pageNo, HttpSession session, Model model, Pager pager) {
		String userId = (String) session.getAttribute("userId");
		pager = subAttendanceService.returnPage(pageNo, pager, userId);
		
		List<SubAttendance> list = subAttendanceService.getSubAttendanceList(pager, userId);
		model.addAttribute("subAttendanceList", list);
		model.addAttribute("pager", pager);
		
		return "subattendance/list";
	}
	
	
	// 휴가 신청 읽기
	@RequestMapping(value="/subattendance/write", method=RequestMethod.GET)
	public String writeSubAttendance() {
		return "/subattendance/write";
	}
	
	// 휴가 신청 쓰기
	@RequestMapping(value="/subattendance/write", method=RequestMethod.POST)
	public String writeSubAttendance(HttpSession session, SubAttendance subAttendance, BindingResult result, 
			RedirectAttributes redirectAttrs, String date,
			String subAttTime, String subLeaveTime) {
		
		// session userId 를 가져옴
		String userId = (String) session.getAttribute("userId");
		
		// 휴가 신청시 이미 행이 있는지 체크 ( ex : 만약 조퇴를 할 때 내가 이미 출근은 한 상태에서 조퇴를 하게 되면)
		String check = subAttendanceService.selectCheckAttendance(date, userId);
		
		if(check == null) {
			// session subjectId를 가져옴
			int subjectId = (Integer) session.getAttribute("subjectId");
			
			// String -> Date (형식을 맞춰주기 위해)
			SimpleDateFormat attDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date choiceDate = null;
			try {
				choiceDate = attDateFormat.parse(date);
			} catch (Exception e) {
				
			}
			
			// Date -> String (형식을 맞춰주기 위해)
			SimpleDateFormat attDateFormat2 = new SimpleDateFormat("yyyy/MM/dd");
			String choiceDate2 = attDateFormat2.format(choiceDate);
			
			// status를 휴가로 Attendance 테이블에 행 추가
			subAttendanceService.insertAttendance(choiceDate2, userId, subjectId);
 		}
		
		// 신청 날짜
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date today = null;
		try {
			today = dateFormat.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 타임 스탬프에 들어갈 수 있는 형식으로 변경 
		SimpleDateFormat subAttTimeLeaveTimeFormat = new SimpleDateFormat("YYYY-MM-DD");
		String subAttTimeLeaveTime = subAttTimeLeaveTimeFormat.format(today);
		
		String subAttTime1 = subAttTimeLeaveTime + " " + subAttTime +":00";
		String subLeaveTime1 = subAttTimeLeaveTime + " " + subLeaveTime +":00";
		
		// 타임 스탬프 형식으로 변경 String -> Timestamp
		Timestamp subAttTimestamp = Timestamp.valueOf(subAttTime1);
		Timestamp subLeaveTimestamp = Timestamp.valueOf(subLeaveTime1);
		
		//attNo를 얻어내기 위해 Date 날짜 사용
		SimpleDateFormat todayFormat = new SimpleDateFormat("YYYYMMDD");
		String todayString = todayFormat.format(today);
		int attNo = subAttendanceService.selectAttNo(todayString, userId);
		
		try {
			subAttendance.setSubAttTime(subAttTimestamp);
			subAttendance.setSubleaveTime(subLeaveTimestamp);
			subAttendance.setUserId(userId);
			subAttendance.setAttNo(attNo);
			
			// file 보내기
			MultipartFile mfile = subAttendance.getFile();
			if(mfile!=null && !mfile.isEmpty()) {
				SubAttFile file = new SubAttFile();
				file.setSaFileName(mfile.getOriginalFilename());
				file.setSaFileSize(mfile.getSize());
				file.setSaFileContentType(mfile.getContentType());
				file.setSaFileData(mfile.getBytes());
				
				subAttendanceService.insertSubAttendance(subAttendance, file);
			} else {
				subAttendanceService.insertSubAttendance(subAttendance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/attendance/userList";
	}
}
