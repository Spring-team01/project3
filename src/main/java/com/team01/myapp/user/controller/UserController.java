package com.team01.myapp.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.myapp.attendance.service.IAttendanceService;
import com.team01.myapp.user.User;
import com.team01.myapp.user.service.IUserService;

@Controller
public class UserController {
	static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	IUserService userService;
	
	@Autowired
	IAttendanceService attendanceService;

	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	public String login(String userid, String password, HttpSession session, Model model) {
		User user = userService.selectUser(userid);
		if(user != null) {
			String dbPassword = user.getPassword();
				if(dbPassword == null) {
				//아이디가 없음
				model.addAttribute("message", "NOT_VALID_USER");
			}else {
				//아이디 있음
				if(dbPassword.equals(password)) {
					//비밀번호 일치
					session.setAttribute("uId", userid);
					session.setAttribute("uName", user.getuName());
					session.setAttribute("major", user.getMajor());
					session.setAttribute("grade", user.getGrade());
					session.setAttribute("phone", user.getPhone());
					session.setAttribute("uType", user.getuType());
					session.setAttribute("password", user.getPassword());
					session.setAttribute("email", user.getEmail());
					session.setAttribute("subjectId", user.getSubjectId());
					
					Date date = new Date();
					
					// 오늘 날짜 데이터 생성
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYYMMDD");
					String today = simpleDateFormat.format(date);
					
					String uId = (String) session.getAttribute("uId");
					
					String attTime = attendanceService.selectAttTime(today, uId);
					String leaveTime = attendanceService.selectLeaveTime(today, uId);
					
					session.setAttribute("attTime", attTime);
					session.setAttribute("leaveTime", leaveTime);
					
					if(user.getuType().equals("USER")) {
						return "redirect:/home";
					}else {
						return "redirect:/admin/adminhome";
					}
					
				}else {
					//비밀번호 불일치
					model.addAttribute("message", "WRONG_PASSWORD");
				}
			}
		}else {
			model.addAttribute("message", "USER_NOT_FOUND");
		}
		session.invalidate();	
		return "user/login";
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	
}
