package com.team01.myapp.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.service.IAdminService;
import com.team01.myapp.util.Pager;

@Controller
public class AdminController {

	@Autowired
	IAdminService adminService;

	// 관리자 홈
	@RequestMapping(value = "/admin/adminhome", method = RequestMethod.GET)
	public String adminhome() {
		return "admin/adminhome";
	}

	// 게시글 조회 (pagind -> service 에서)
	@RequestMapping(value = "/admin/userList/{subjectId}/{pageNo}", method = RequestMethod.GET)
	public String getUserListBySubject(@PathVariable int subjectId, @PathVariable String pageNo, Model model,
			Pager pager) {
		pager = adminService.returnPage(pageNo, pager);
		System.out.println("컨트롤러:");
		List<UserList> userList = adminService.getUserListBySubject(subjectId, pager);
		model.addAttribute("userList", userList);
		model.addAttribute("pager", pager);
		System.out.println("컨트롤러:" + userList.toString());
		return "admin/userList";
	}

	@RequestMapping(value = "/admin/register", method = RequestMethod.GET)
	public String register() {
		return "admin/register";
	}

}
