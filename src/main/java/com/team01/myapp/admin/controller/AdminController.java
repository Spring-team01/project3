package com.team01.myapp.admin.controller;

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

import com.team01.myapp.admin.model.ReasonList;
import com.team01.myapp.admin.model.UserInsert;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.admin.service.IAdminService;
import com.team01.myapp.board.controller.BoardController;
import com.team01.myapp.util.Pager;

@Controller
public class AdminController {
	static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	IAdminService adminService;

	// 관리자 홈
	@RequestMapping(value = "/admin/adminhome", method = RequestMethod.GET)
	public String adminhome() {
		return "admin/adminhome";
	}

	// 게시글 조회 (pagind -> service 에서)
	@RequestMapping(value = "/admin/userlist/{subjectId}/{pageNo}", method = RequestMethod.GET)
	public String getUserListBySubject(@PathVariable int subjectId, @PathVariable String pageNo, Model model,
			Pager pager) {
		pager = adminService.returnPage(pageNo, pager);
		List<UserList> userList = adminService.getUserListBySubject(subjectId, pager);
		model.addAttribute("userList", userList);
		model.addAttribute("pager", pager);
		System.out.println("컨트롤러:" + userList);
		return "admin/userlist";
	}

	@RequestMapping(value = "/admin/register", method = RequestMethod.GET)
	public String register() {
		return "admin/userdetail";
	}

	/// admin/reasonList

	@RequestMapping(value = "/admin/reasonlist/{resultNum}/{pageNo}", method = RequestMethod.GET)
	public String reasonList(@PathVariable int resultNum, @PathVariable String pageNo, Model model, Pager pager) {
		pager = adminService.returnPage(pageNo, pager);
		String result = null;
		if (resultNum == 1) {
			result = "미처리";
		} else {
			result = "처리";
		}
		List<ReasonList> reasonList = adminService.getReasonListbyResult(result, pager);
		model.addAttribute("reasonList", reasonList);
		model.addAttribute("pager", pager);

		return "admin/reasonlist";
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

		return "admin/adminhome";

	}

	@RequestMapping(value = "/admin/userdetail/{userId}", method = RequestMethod.POST)
	public String userDetail(@PathVariable String userId, Model model) {
		return null;

	}

}
