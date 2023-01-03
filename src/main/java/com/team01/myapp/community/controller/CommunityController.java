package com.team01.myapp.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team01.myapp.community.dao.ICommunityRepository;
import com.team01.myapp.community.service.ICommunityService;

@Controller
public class CommunityController {
	static final Logger logeer = LoggerFactory.getLogger(CommunityController.class);
	@Autowired
	ICommunityService communityService;
	@Autowired
	ICommunityRepository communityRepository;
	
	
	public String writeCommunity() {
		
		return "community/communityWrite";
	}
	
	
	
}
