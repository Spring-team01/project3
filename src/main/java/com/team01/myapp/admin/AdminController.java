package com.team01.myapp.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class AdminController {
	@RequestMapping(value="/admin/adminhome", method=RequestMethod.GET)
	public String adminhome() {
		return "admin/adminhome";
	}
}
