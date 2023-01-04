package com.team01.myapp.community.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.service.ICommunityService;
import com.team01.myapp.util.Pager;

@Controller
public class CommunityController {
	static final Logger logeer = LoggerFactory.getLogger(CommunityController.class);
	@Autowired
	ICommunityService communityService;
	
	
	//게시글 작성
	@RequestMapping(value = "/community/write/{communityCategoryId}", method = RequestMethod.GET)
	public String writeCommunity(@PathVariable int communityCategoryId, Model model) {
		model.addAttribute("communityCategoryId", communityCategoryId);
		return "community/communityWrite";
	}

	@RequestMapping(value = "/community/write/", method = RequestMethod.POST)
	public String writeCommunity(Community community, BindingResult result, RedirectAttributes redirectAttrs,
			HttpSession session) {
		try {
			community.setUsersId((String) session.getAttribute("uId"));
			community.setCommunityEmail((String) session.getAttribute("email"));
			// 카테고리 아이디 임시로 1
			community.setCommunityCategoryId(1);

			communityService.writeCommunity(community);

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/community/write/1";
	}

	
	//게시글 조회 (pagind -> service 에서)
	@RequestMapping(value = "/community/communityList/{categoryId}/{pageNo}", method = RequestMethod.GET)
	public String getCommunityListByCategory(@PathVariable int categoryId, @PathVariable String pageNo, Model model, Pager pager) {
		
		pager = communityService.returnPage(pageNo, pager);
		
		List<Community> communityList = communityService.getCommunityListByCategory(categoryId, pager);
		
		
		
		model.addAttribute("communityList", communityList);
		model.addAttribute("pager", pager);
		
		return "community/communityList";
	}

}
