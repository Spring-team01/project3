package com.team01.myapp.community.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.myapp.community.dao.ICommunityRepository;
import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.service.ICommunityService;

@Controller
public class CommunityController {
	static final Logger logeer = LoggerFactory.getLogger(CommunityController.class);
	@Autowired
	ICommunityService communityService;
	@Autowired
	ICommunityRepository communityRepository;
	
	
// 게시글 조회 (GET)
	@RequestMapping(value="/community/write/{communityCategoryId}", method=RequestMethod.GET)
	public String writeCommunity(@PathVariable int communityCategoryId, Model model) {
		List<Community> communityList = communityService.getCommunityListByCategory();
		model.addAttribute("communityList", communityList);
//		혹시 몰라서 넣음.
		model.addAttribute("communityCategoryId", communityCategoryId);
		return "community/communityWrite";
	}
	
	
	
	
	
	
	
}
