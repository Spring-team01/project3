package com.team01.myapp.admin.controller;

import java.nio.charset.Charset;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.myapp.admin.model.AttSumDailyVo;
import com.team01.myapp.admin.model.AttSummaryVo;
import com.team01.myapp.admin.model.Reports;
import com.team01.myapp.admin.model.SubAttList;
import com.team01.myapp.admin.model.SubAttendance;
import com.team01.myapp.admin.model.User;
import com.team01.myapp.admin.model.UserInsert;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.admin.service.IAdminService;
import com.team01.myapp.util.Pager;

@Controller
public class AdminController {
	static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	IAdminService adminService;

	// 관리자 홈
	@RequestMapping(value = "/admin/adminhome", method = RequestMethod.GET)
	public String adminhome(Model model, Pager pager) {
		List<AttSummaryVo> attSumDailyTotal = new ArrayList<AttSummaryVo>();
		AttSummaryVo attSumDaily1 = adminService.attSumDaily(1);
		AttSummaryVo attSumDaily2 = adminService.attSumDaily(2);
		AttSummaryVo attSumDaily3 = adminService.attSumDaily(3);

		attSumDailyTotal.add(attSumDaily1);
		attSumDailyTotal.add(attSumDaily2);
		attSumDailyTotal.add(attSumDaily3);

		model.addAttribute("attSumDailyTotal", attSumDailyTotal);

		pager = adminService.SubAttendanceListPage("1", 0);
		List<SubAttList> subAttList = adminService.getSubAttListbyRNum(0, pager);
		model.addAttribute("subAttList", subAttList);
		
		pager = adminService.getReprtListPage("1", 0);

		List<Reports> reportList = adminService.getReportList(0, pager);
		model.addAttribute("reportList", reportList);

		return "admin/adminHome";
	}

	// 과목별 학생 목록 조회
	@RequestMapping(value = "/admin/userlist/{subjectId}/{pageNo}", method = RequestMethod.GET)
	public String getUserListBySubject(@PathVariable int subjectId, @PathVariable String pageNo, Model model,
			Pager pager) {
		pager = adminService.returnPage(pageNo, pager, subjectId);
		List<UserList> userList = adminService.getUserListBySubject(subjectId, pager);
		model.addAttribute("userList", userList);
		model.addAttribute("pager", pager);
		return "admin/userList";
	}

	// 학생 상세 조회
	@RequestMapping("/admin/userdetail/{userId}")
	public String getUser(@PathVariable String userId, Model model) {
		User user = adminService.getUser(userId);
		model.addAttribute("user", user);
		return "admin/userDetail";
	}

	// 학생 사진 조회
	@RequestMapping("/admin/userdetail/userfile/{userFileId}")
	public ResponseEntity<byte[]> getuserFile(@PathVariable String userFileId) {
		UserUploadFile file = adminService.getFile(userFileId);
		logger.info("getFile" + file.toString());
		// 기본 이미지
		if (file.getUserFileName() == null) {
			file = adminService.getFile("2");
		}
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getUserFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getUserFileSize());
		headers.setContentDispositionFormData("attachment", file.getUserFileName(), Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(file.getUserFileData(), headers, HttpStatus.OK);
	}

	// 학생 정보 수정
	@RequestMapping(value = "/admin/update/{userId}", method = RequestMethod.GET)
	public String updateUser(@PathVariable String userId, Model model) {
		User user = adminService.getUser(userId);
		model.addAttribute("user", user);
		return "admin/updateUser";
	}

	// 학생 정보 수정
	@RequestMapping(value = "/admin/update", method = RequestMethod.POST)
	public String updateUser(User user, BindingResult result, RedirectAttributes redirectAttrs) {
		logger.info("/admin/update " + user.toString());
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
				adminService.updateUser(user, file);
			} else {
				adminService.updateUser(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/admin/userdetail/" + user.getUserId();
	}

	// 휴가 목록 조회
	@RequestMapping(value = "/admin/subattendancelist/{pageNo}", method = RequestMethod.GET)
	public String getSubAttendanceList(@PathVariable String pageNo,
			@RequestParam(value = "resultNumber", required = false, defaultValue = "0") String resultNumber,
			Model model) {
		int resultNum = Integer.parseInt(resultNumber);
		Pager pager = adminService.SubAttendanceListPage(pageNo, resultNum);
		List<SubAttList> subAttList = adminService.getSubAttListbyRNum(resultNum, pager);
		model.addAttribute("subAttList", subAttList);
		model.addAttribute("pager", pager);
		model.addAttribute("resultNumber", resultNumber);

		return "admin/subAttList";
	}

	// 휴가 상세 조회
	@RequestMapping(value = "/admin/reasondetail/{subAttNo}", method = RequestMethod.GET)
	public String getReason(@PathVariable int subAttNo, Model model) {
		SubAttendance subAttendance = adminService.selectSubAttendanceDetail(subAttNo);
		model.addAttribute("subAttendance", subAttendance);
		return "admin/reasonDetail";
	}

	// 휴가 처리
	// result = 1 -> 승인
	// result = 2 -> 반려
	@RequestMapping(value = "/admin/updatestatus/{subAttNo}/{result}", method = RequestMethod.GET)
	public String updateStatus(@PathVariable int subAttNo, @PathVariable int result, Model model) {
		SubAttendance subAttendance = adminService.selectSubAttendanceDetail(subAttNo);
		adminService.updateStatus(subAttendance, result);
		return "redirect:/admin/subattendancelist/1";

	}

	// 전체 출결 조회
	@RequestMapping(value = "/admin/attsum/{subjectId}", method = RequestMethod.GET)
	public String attSum(@PathVariable int subjectId, Model model) {
		AttSummaryVo attSumDaily = adminService.attSumDaily(subjectId);
		AttSummaryVo attSumMonthly = adminService.attsumMonthly(subjectId);
		model.addAttribute("attSumDaily", attSumDaily);
		model.addAttribute("attSumMonthly", attSumMonthly);
		model.addAttribute("subjectId", subjectId);
		return "admin/attSum";
	}

	// 학생 출결 월별 조회
	@RequestMapping(value = "/admin/attsummonthly/{subjectId}", method = RequestMethod.GET)
	public String attSumMonthly(@PathVariable int subjectId, Model model) {
		List<AttSummaryVo> sumMonthlyVo = adminService.attsumMonthlyByuser(subjectId);
		model.addAttribute("subjectName", sumMonthlyVo.get(1).getSubjectName());
		model.addAttribute("sumMonthlyVo", sumMonthlyVo);
		return "admin/attSumMonthly";
	}

	// 학생 출결 일별 조회
	@RequestMapping(value = "/admin/attsumdaily/{subjectId}", method = RequestMethod.GET)
	public String attSumDaily(@PathVariable int subjectId, Model model) {
		List<AttSumDailyVo> sumDailyVo = adminService.attSumDailyByuser(subjectId);
		model.addAttribute("subjectName", sumDailyVo.get(1).getSubjectName());
		model.addAttribute("sumDailyVo", sumDailyVo);
		return "admin/attSumDaily";
	}

	// 신고 목록 조회
	@RequestMapping("/admin/report/list/{pageNo}")
	public String reportList(@PathVariable String pageNo,
			@RequestParam(value = "resultNumber", required = false, defaultValue = "0") String resultNumber,
			Model model, Pager pager) {
		int resultNum = Integer.parseInt(resultNumber);
		// 1. 페이징 객체 만들기
		pager = adminService.getReprtListPage(pageNo, resultNum);

		// 2. 페이지 리스트 만들기
		List<Reports> reportList = adminService.getReportList(resultNum, pager);
		model.addAttribute("reportList", reportList);
		model.addAttribute("pager", pager);
		model.addAttribute("resultNumber", resultNumber);
		return "admin/reportList";
	}

	// 로그아웃
	@RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "user/login";
	}

	/*
	 * @RequestMapping(value = "/admin/attendancestatus/month", method =
	 * RequestMethod.GET) public String statusMonthlyList(Model model) { return
	 * "admin/attendanceStatus";
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value = "/admin/file", method = RequestMethod.POST) public
	 * String insertFile(UserInsert userInsert, BindingResult result,
	 * RedirectAttributes redirectAttrs, HttpSession session) { try { MultipartFile
	 * mfile = userInsert.getFile(); UserUploadFile file = new UserUploadFile();
	 * file.setUserFileName(mfile.getOriginalFilename());
	 * file.setUserFileSize(mfile.getSize());
	 * file.setUserFileContentType(mfile.getContentType());
	 * file.setUserFileData(mfile.getBytes()); logger.info("/board/write : " +
	 * file.toString());
	 * 
	 * adminService.insertUserFile(file); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * return "admin/adminHome";
	 * 
	 * }
	 */

}
