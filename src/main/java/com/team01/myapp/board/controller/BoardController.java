package com.team01.myapp.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.myapp.board.service.IBoardService;

@Controller
public class BoardController {
	
	@Autowired
	IBoardService boardService;
	
	@RequestMapping("/boardlist")
	public String getList(HttpSession session, Model model) {
		//model.addAttribute("categoryId",categoryId);
		//List<Board> boardList = boardService.selectList(categoryId);
		//model.addAttribute("boardList", boardList);
		return "board/boardlist";
	}
	

}
