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
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.service.IBoardService;
import com.team01.myapp.util.Pager;

@Controller
public class BoardController {
	static final Logger logger =LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	IBoardService boardService;
	
	@RequestMapping(value="/boardlist/{pageNo}", method = RequestMethod.GET)
	public String getListAll(@PathVariable String pageNo, HttpSession session, Model model, Pager pager) {
		pager = boardService.returnPage(pageNo, pager);
		
		List<Board> boardList = boardService.getTotalArticleList(pager);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager",pager);
		
		return "board/list";
		
	}
	
	@RequestMapping(value="/board/{categoryId}/{pageNo}",  method = RequestMethod.GET)
	public String getListByCategory(@PathVariable int categoryId, @PathVariable String pageNo, HttpSession session, Model model, Pager pager) {
		
		pager = boardService.returnPage(pageNo, pager);
		
		List<Board> boardList = boardService.getArticleListByCategory(categoryId, pager);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager",pager);
		
		return "board/list";
	}
	
}