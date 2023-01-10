package com.team01.myapp.admin.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.myapp.admin.model.ReasonList;
import com.team01.myapp.admin.model.User;
import com.team01.myapp.admin.model.UserInsert;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.admin.service.IAdminService;
import com.team01.myapp.board.controller.BoardController;
import com.team01.myapp.board.model.BoardUploadFile;
import com.team01.myapp.util.Pager;

@Controller
public class AdminController {
	static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	IAdminService adminService;

	// 관리자 홈
	@RequestMapping(value = "/admin/adminhome", method = RequestMethod.GET)
	public String adminhome() {
		return "admin/adminHome";
	}
	
	//1. select
	//과목별 학생 목록 조회
	@RequestMapping(value = "/admin/userlist/{subjectId}/{pageNo}", method = RequestMethod.GET)
	public String getUserListBySubject(@PathVariable int subjectId, @PathVariable String pageNo, Model model,
			Pager pager) {
		pager = adminService.returnPage(pageNo, pager, subjectId);
		List<UserList> userList = adminService.getUserListBySubject(subjectId, pager);
		model.addAttribute("userList", userList);
		model.addAttribute("pager", pager);
		return "admin/userList";
	}
	
	//학생 상세 조회
	@RequestMapping("/admin/userdetail/{userId}")
	public String getUser(@PathVariable String userId, Model model) {
		User user  = adminService.getUser(userId);
		model.addAttribute("user", user);
		return "admin/userDetail";
	}
	
	//사진 조회
	@RequestMapping("/admin/userdetail/userfile/{userFileId}")
	public ResponseEntity<byte[]> getuserFile(@PathVariable String userFileId){
		UserUploadFile file = adminService.getFile(userFileId);
		logger.info("getFile"+file.toString());
		final HttpHeaders headers =new HttpHeaders();
		String[] mtypes = file.getUserFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getUserFileSize());
		headers.setContentDispositionFormData("attachment", file.getUserFileName(),Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(file.getUserFileData(),headers,HttpStatus.OK);
	}
	
	//2. update
	@RequestMapping(value = "/admin/update/{userId}", method = RequestMethod.GET)
	public String updateUser(@PathVariable String userId, Model model) {
		User user  = adminService.getUser(userId);
		model.addAttribute("user", user);
		return "admin/updateUser";
	}
	
	@RequestMapping(value="/admin/update", method=RequestMethod.POST)
	public String updateUser(User user, BindingResult result, RedirectAttributes redirectAttrs, HttpSession session) {
		logger.info("/admin/update " + user.toString());
		try {
			user.setUserId(Jsoup.clean(user.getUserId(), Whitelist.basic()));
			user.setUserName(Jsoup.clean(user.getUserName(), Whitelist.basic()));
			user.setEmail(Jsoup.clean(user.getEmail(), Whitelist.basic()));
			user.setPhone(Jsoup.clean(user.getPhone(), Whitelist.basic()));
			user.setPassword(Jsoup.clean(user.getPassword(), Whitelist.basic()));
			
			MultipartFile mfile = user.getFile();
			System.out.println(mfile.getOriginalFilename());
			
			if(mfile!=null&&!mfile.isEmpty()) {
				logger.info("/admin/update: "+mfile.getOriginalFilename());
				UserUploadFile file = new UserUploadFile();
				file.setUserFileName(mfile.getOriginalFilename());
				file.setUserFileSize(mfile.getSize());
				file.setUserFileContentType(mfile.getContentType());
				file.setUserFileData(mfile.getBytes());
				logger.info("/admin/update : "+ file.toString());
				
				adminService.updateUser(user, file);
			}else {
				adminService.updateUser(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/admin/userdetail/"+user.getUserId();
	}
	

	/// admin/reasonList
	
	//수정할 것
	@RequestMapping(value = "/admin/reasonlist/{resultNum}/{pageNo}", method = RequestMethod.GET)
	public String reasonList(@PathVariable int resultNum, @PathVariable String pageNo, Model model, Pager pager) {
		pager = adminService.returnPage(pageNo, pager , resultNum);
		String result = null;
		if (resultNum == 1) {
			result = "미처리";
		} else {
			result = "처리";
		}
		List<ReasonList> reasonList = adminService.getReasonListbyResult(result, pager);
		model.addAttribute("reasonList", reasonList);
		model.addAttribute("pager", pager);

		return "admin/reasonList";
	}

	@RequestMapping(value = "/admin/file", method = RequestMethod.POST)
	public String insertFile(UserInsert userInsert, BindingResult result, RedirectAttributes redirectAttrs,
			HttpSession session) {
		try {
			MultipartFile mfile = userInsert.getFile();
			UserUploadFile file = new UserUploadFile();
			file.setUserFileName(mfile.getOriginalFilename());
			file.setUserFileSize(mfile.getSize());
			file.setUserFileContentType(mfile.getContentType());
			file.setUserFileData(mfile.getBytes());
			logger.info("/board/write : " + file.toString());

			adminService.insertUserFile(file);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "admin/adminHome";

	}
	
	@RequestMapping(value = "/admin/attendancestatus/month", method = RequestMethod.GET)
	public String statusMonthlyList(Model model) {
		return "admin/attendanceStatus";
		
	}
	
	@RequestMapping(value="/admin/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate(); //로그아웃
		return "user/login";
	}
	
	

}
