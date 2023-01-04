package com.team01.myapp.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.service.IBoardService;

@Controller
public class BoardController {
	static final Logger logger =LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	IBoardService boardService;
	
	@RequestMapping("/boardlist/{page}")
	public String getListAll(@PathVariable int page, HttpSession session, Model model) {
		
		session.setAttribute("page", page);
		List<Board> boardList = boardService.selectTotalArticleList(page);
		model.addAttribute("boardList", boardList);
		System.out.println(boardList);
		//paging start
		int bbsCount = boardService.selectTotalArticleCount();
		int totalPage = 0;
		if(bbsCount > 0) {
			totalPage=(int)Math.ceil(bbsCount/10.0);
		}
		model.addAttribute("totalPageCount", totalPage);
		model.addAttribute("page",page);
		
		return "board/list";
		
	}

	@RequestMapping("/board/cat/{categoryId}/{page}")
	public String getListByCategory(@PathVariable int categoryId, @PathVariable int page, HttpSession session, Model model) {
		
		session.setAttribute("page", page);
		model.addAttribute("categoryId", categoryId);
		
		List<Board> boardList= boardService.selectArticleListByCategory(categoryId, page);
		model.addAttribute("boardList", boardList);
		
		//paging start
		int bbsCount = boardService.selectTotalArticleCountByCategoryId(categoryId);
		int totalPage = 0;
		if(bbsCount > 0) {
			totalPage=(int)Math.ceil(bbsCount/10.0);
		}
		model.addAttribute("totalPageCount", totalPage);
		model.addAttribute("page",page);
		
		return "board/list";
	}
	
}