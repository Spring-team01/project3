package com.team01.myapp.subattendance.controller;

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
	public String writeSubAttendance(SubAttendance subAttendance, BindingResult result, 
			RedirectAttributes redirectAttrs, String date,
			String subAttTime, String subleaveTime, String category) {
		
		System.out.println("date : " + date);
		System.out.println("subAttTime : " + subAttTime);
		System.out.println("subleaveTime : " + subleaveTime);
		System.out.println("category : " + category);
		System.out.println("/subattendamce/write : " + subAttendance.toString());
		
		try {
			
		} catch (Exception e) {
			
		}
		
		
		
		return "/subattendance/list";
	}
}
