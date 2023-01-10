package com.team01.myapp.community.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityComment;
import com.team01.myapp.community.model.CommunityFile;
import com.team01.myapp.community.service.ICommunityService;
import com.team01.myapp.util.Pager;

@Controller
public class CommunityController {
	static final Logger logeer = LoggerFactory.getLogger(CommunityController.class);
	@Autowired
	ICommunityService communityService;

	// 게시글 작성
	@RequestMapping(value = "/community/write/{communityCategoryId}", method = RequestMethod.GET)
	public String writeCommunity(@PathVariable int communityCategoryId, Model model) {
		model.addAttribute("communityCategoryId", communityCategoryId);
		return "community/communityWrite";
	}

	@RequestMapping(value = "/community/write", method = RequestMethod.POST)
	public String writeCommunity(Community community, BindingResult result, RedirectAttributes redirectAttrs,
			HttpSession session) {

		try {
			// XSSS 대응
			community.setCommunityTitle(Jsoup.clean(community.getCommunityTitle(), Whitelist.basic()));
			community.setCommunityContent(Jsoup.clean(community.getCommunityContent(), Whitelist.basic()));

			community.setCommunityContent(community.getCommunityContent().replace("\r\n", "<br>"));
			community.setUsersId((String) session.getAttribute("userId"));
			community.setUserName((String) session.getAttribute("userName"));
			community.setCommunityEmail((String) session.getAttribute("email"));
			// 카테고리 아이디 임시로 1
			community.setCommunityCategoryId(1);

			MultipartFile mfile = community.getFile();

			if (mfile != null && !mfile.isEmpty()) {
				CommunityFile file = new CommunityFile();
				file.setCommunityFileName(mfile.getOriginalFilename());
				file.setCommunityFileSize(mfile.getSize());
				file.setCommunityFileContentType(mfile.getContentType());
				file.setCommunityFileData(mfile.getBytes());
				communityService.writeCommunity(community, file);

			} else {
				communityService.writeCommunity(community);
			}

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/community/communityDetail/" + (community.getCommunityBoardId());
	}

	@RequestMapping(value = "/community/communityList/{categoryId}/{pageNo}", method = RequestMethod.GET)
	public String getCommunityListByCategory(@PathVariable int categoryId, @PathVariable String pageNo, Model model,
		Pager pager, HttpSession session, Community community) {
		pager = communityService.returnPage(pageNo, pager);
		community.setUserName((String) session.getAttribute("userName"));
		List<Community> communityList = communityService.getCommunityListByCategory(categoryId, pager);
		model.addAttribute("sessionUserId", (String) session.getAttribute("userId"));
		model.addAttribute("communityList", communityList);
		model.addAttribute("pager", pager);

		return "community/communityList";
	}

	// 상세 게시글 조회
	@RequestMapping(value = "/community/communityDetail/{communityBoardId}", method = RequestMethod.GET)
	public String readCommunity(@PathVariable int communityBoardId, Model model, HttpSession session) {
		Community community = communityService.readCommunityDetail(communityBoardId);
		community.setUserName((String) session.getAttribute("userName"));
		List<CommunityComment> commentList = communityService.getCommunityComment(communityBoardId);

		model.addAttribute("community", community);
		model.addAttribute("commentList", commentList);
		model.addAttribute("sessionUserId", (String) session.getAttribute("userId"));
		return "community/communityDetail";
	}

	@RequestMapping(value = "/files/{communityBoardId}")
	public ResponseEntity<byte[]> getFile(@PathVariable int communityBoardId) {
		CommunityFile communityFile = communityService.getFile(communityBoardId);
		HttpHeaders header = new HttpHeaders();
		String[] filetypes = communityFile.getCommunityFileContentType().split("/");
		header.setContentType(new MediaType(filetypes[0], filetypes[1]));
		header.setContentLength(communityFile.getCommunityFileSize());
		header.setContentDispositionFormData("attachment", communityFile.getCommunityFileName(),
				Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(communityFile.getCommunityFileData(), header, HttpStatus.OK);
	}

	// 글 수정
	@RequestMapping(value = "/community/communityUpdate/{communityBoardId}", method = RequestMethod.GET)
	public String updateArticle(@PathVariable int communityBoardId, Model model, HttpSession session) {
		Community community = communityService.readCommunityDetail(communityBoardId);
		community.setUsersId((String) session.getAttribute("userId"));
		community.setUserName((String) session.getAttribute("userName"));
		model.addAttribute("userId", community.getUsersId());
		model.addAttribute("sessionUserId", (String) session.getAttribute("userId"));
		model.addAttribute("categoryId", community.getCommunityCategoryId());
		model.addAttribute("community", community);
		return "community/communityUpdate";
	}

	@RequestMapping(value = "/community/update", method = RequestMethod.POST)
	public String updateCommunity(Community community, BindingResult result, RedirectAttributes redirectAttrs,
			HttpSession session) {
		try {
			// XSSS 대응
			community.setCommunityTitle(Jsoup.clean(community.getCommunityTitle(), Whitelist.basic()));
			community.setCommunityContent(Jsoup.clean(community.getCommunityContent(), Whitelist.basic()));

			community.setCommunityContent(community.getCommunityContent().replace("\r\n", "<br>"));
			community.setUsersId((String) session.getAttribute("userId"));
			community.setUserName((String) session.getAttribute("userName"));
			community.setCommunityEmail((String) session.getAttribute("email"));

			// 카테고리 아이디 임시로 1
			community.setCommunityCategoryId(1);

			MultipartFile mfile = community.getFile();

			if (mfile != null && !mfile.isEmpty()) {
				CommunityFile file = new CommunityFile();
				file.setCommunityFileName(mfile.getOriginalFilename());
				file.setCommunityFileSize(mfile.getSize());
				file.setCommunityFileContentType(mfile.getContentType());
				file.setCommunityFileData(mfile.getBytes());
				communityService.updateCommunity(community, file);
			} else {
				communityService.updateCommunity(community);
			}

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/community/communityDetail/" + (community.getCommunityBoardId());
	}

	// 삭제
	@RequestMapping(value = "/community/delete/{communityBoardId}", method = RequestMethod.GET)
	public String deleteCommunity(@PathVariable int communityBoardId, Model model, HttpSession session,
			Community community) {
		community.setUsersId((String) session.getAttribute("userId"));
		community.setUserName((String) session.getAttribute("userName"));
		model.addAttribute("communityBoardId", communityBoardId);
		return "community/communityDelete";
	}

	@RequestMapping(value = "/community/delete", method = RequestMethod.POST)
	public String deleteArticle(Community community, BindingResult result, HttpSession session, Model model) {
		try {
			community.setUsersId((String) session.getAttribute("userId"));
			community.setUserName((String) session.getAttribute("userName"));

			String dbpw = communityService.getPassword(community.getCommunityBoardId());
			if (dbpw.equals(community.getCommunityPassword())) {
				communityService.deleteCommunity(community.getCommunityBoardId());
				return "redirect:/community/communityList/1/1";
			} else {
				model.addAttribute("message", "WRONG_PASSWORD_NOT_DELETED");
			}

			return "redirect:/community/communityDetail/" + community.getCommunityBoardId();
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "redirect:/community/communityList/1/1";
		}
	}

	@RequestMapping("/community/search/{pageNo}")
	public String search(@RequestParam(required = false, defaultValue = "") String keyword, @PathVariable String pageNo,
			Pager pager, HttpSession session, Model model, Community community) {

		System.out.println(keyword);
		try {
			community.setUsersId((String) session.getAttribute("userId"));
			community.setUserName((String) session.getAttribute("userName"));

			pager = communityService.returnKeywordPager(pageNo, keyword, pager);
			List<Community> communityList = communityService.searchListByContentKeyword(keyword, pager);

			model.addAttribute("communityList", communityList);
			model.addAttribute("sessionUserId", (String) session.getAttribute("userId"));
			model.addAttribute("pager", pager);
			model.addAttribute("keyword", keyword);
			return "community/communityList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "community/communitySearch";
	}

	// 댓글 달기
	@RequestMapping(value = "/community/reply/comment", method = RequestMethod.POST)
	public String writeCommunityReply(CommunityComment comment, BindingResult result, RedirectAttributes redirectAttrs,
			HttpSession session, Community community) {
		comment.setUserId((String) session.getAttribute("userId"));
		communityService.writeCommunityReply(comment);

		return "redirect:/community/communityDetail/" + (community.getCommunityBoardId());
	}
	
	//대댓글 조회하기
	@RequestMapping(value="/community/getreplycomment/{communityBoardId}")
	@ResponseBody
	public List<CommunityComment> getReplyCommnet(@RequestParam int communityBoardId) {
		
		
		return communityService.getCommunityComment(communityBoardId);
	}
	
	
	// Home View
	@RequestMapping(value = "/community/communityMiniView")
	public String example(HttpSession session, Community community, Model model) {
		
		community.setUserName((String) session.getAttribute("userName"));
		List<Community> communityList = communityService.readCountListByCategory(1);
		model.addAttribute("sessionUserId", (String) session.getAttribute("userId"));
		model.addAttribute("communityList", communityList);
		
		return "community/communityMiniView";
	}

}
