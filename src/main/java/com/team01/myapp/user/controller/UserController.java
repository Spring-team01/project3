package com.team01.myapp.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
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

import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.attendance.service.IAttendanceService;
import com.team01.myapp.user.model.User;
import com.team01.myapp.user.service.IUserService;

@Controller
public class UserController {
	static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	IUserService userService;

	@Autowired
	IAttendanceService attendanceService;

	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(String userid, String password, HttpSession session, Model model) {
		User user = userService.selectUser(userid);
		if (user != null) {//아이디가 있다면
			String dbPassword = user.getPassword();
			if (dbPassword.equals(password)) {
				// 비밀번호 일치
				session.setAttribute("userId", userid);
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("major", user.getMajor());
				session.setAttribute("grade", user.getGrade());
				session.setAttribute("phone", user.getPhone());
				session.setAttribute("userType", user.getUserType());
				session.setAttribute("password", user.getPassword());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("subjectId", user.getSubjectId());
				session.setAttribute("userFileId", user.getUserFileId());

				Date date = new Date();

				// 오늘 날짜 데이터 생성
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYYMMDD");
				String today = simpleDateFormat.format(date);

				String userId = (String) session.getAttribute("userId");

				String attTime = attendanceService.selectAttTime(today, userId);
				String leaveTime = attendanceService.selectLeaveTime(today, userId);

				session.setAttribute("attTime", attTime);
				session.setAttribute("leaveTime", leaveTime);
				if (user.getUserType().equals("USER")) {
					return "redirect:/home";
				} else {
					return "redirect:/admin/adminhome";
				}

			} else {
				model.addAttribute("message", "비밀번호가 다릅니다.");
			}

		} else {
			model.addAttribute("message", "사용자가 없습니다. 아이디를 확인하세요.");
		}
		session.invalidate();
		return "user/login";
	}

	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate(); // 로그아웃
		return "user/login";
	}

	// 학생 정보 수정
	@RequestMapping(value = "/user/update/{userId}", method = RequestMethod.GET)
	public String updateUser(@PathVariable String userId, Model model) {
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		return "user/updateUser";
	}

	// 학생 정보 수정
	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public String updateUser(User user, BindingResult result, RedirectAttributes redirectAttrs, HttpSession session) {
		try {
			user.setUserId(Jsoup.clean(user.getUserId(), Whitelist.basic()));
			user.setUserName(Jsoup.clean(user.getUserName(), Whitelist.basic()));
			user.setEmail(Jsoup.clean(user.getEmail(), Whitelist.basic()));
			user.setPhone(Jsoup.clean(user.getPhone(), Whitelist.basic()));
			user.setPassword(Jsoup.clean(user.getPassword(), Whitelist.basic()));

			MultipartFile mfile = user.getFile();

			if (mfile != null && !mfile.isEmpty()) {
				UserUploadFile file = new UserUploadFile();
				file.setUserFileName(mfile.getOriginalFilename());
				file.setUserFileSize(mfile.getSize());
				file.setUserFileContentType(mfile.getContentType());
				file.setUserFileData(mfile.getBytes());
				userService.updateUser(user, file);
			} else {
				userService.updateUser(user);
			}
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userName", user.getUserName());
			session.setAttribute("grade", user.getGrade());
			session.setAttribute("phone", user.getPhone());
			session.setAttribute("password", user.getPassword());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("subjectId", user.getSubjectId());

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/home";
	}
}
