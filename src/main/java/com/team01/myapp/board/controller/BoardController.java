package com.team01.myapp.board.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardUploadFile;
import com.team01.myapp.board.service.IBoardService;
import com.team01.myapp.util.Pager;

@Controller
public class BoardController {
	static final Logger logger =LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	IBoardService boardService;
	//모든 리스트 가져오기 
	@RequestMapping(value="/boardlist/{pageNo}", method = RequestMethod.GET)
	public String getListAll(@PathVariable String pageNo, HttpSession session, Model model, Pager pager) {
		pager = boardService.returnPage(pageNo, pager);
		
		List<Board> boardList = boardService.getTotalArticleList(pager);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager",pager);
		
		return "board/list";
		
	}
	//카테고리별 리스트 가져오기
	@RequestMapping(value="/board/{categoryId}/{pageNo}",  method = RequestMethod.GET)
	public String getListByCategory(@PathVariable int categoryId, @PathVariable String pageNo, HttpSession session, Model model, Pager pager) {
		
		pager = boardService.returnCategoryPage(categoryId, pageNo, pager);
		
		List<Board> boardList = boardService.getArticleListByCategory(categoryId, pager);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager",pager);
		
		return "board/list";
	}
	
	//읽기
	@RequestMapping("/board/view/{boardId}/{page}")
	public String getBoardDetails(@PathVariable int boardId, @PathVariable int page, Model model) {
		Board board = boardService.selectArticle(boardId);
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		model.addAttribute("categoryId", board.getCategoryId());
		logger.info("getBoardDetails" +board.toString());
		return "board/view";
	}
	
	@RequestMapping("/boardfile/{boardFileId}")
	public ResponseEntity<byte[]> getBoardFile(@PathVariable int boardFileId){
		BoardUploadFile file = boardService.getFile(boardFileId);
		logger.info("getFile"+file.toString());
		final HttpHeaders headers =new HttpHeaders();
		String[] mtypes = file.getBoardFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getBoardFileSize());
		headers.setContentDispositionFormData("attachment", file.getBoardFileName(),Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(file.getBoardFileData(),headers,HttpStatus.OK);
	}
	
	//쓰기 
	@RequestMapping(value="/board/write/{categoryId}", method=RequestMethod.GET)
	public String writeArticle(@PathVariable int categoryId, Model model) {
		model.addAttribute("categoryId", categoryId);
		return "board/write";
	}
	
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String writeArticle(Board board, BindingResult result, RedirectAttributes redirectAttrs,HttpSession session) {
		logger.info("/board/write: " +board.toString());
		try {
			board.setTitle(Jsoup.clean(board.getTitle(), Whitelist.basic()));
			board.setContent(Jsoup.clean(board.getContent(), Whitelist.basic()));
			board.setContent(board.getContent().replace("\r\n", "<br>"));
			board.setUserId((String) session.getAttribute("userId"));
			board.setEmail((String) session.getAttribute("email"));
			MultipartFile mfile = board.getFile();
			if(mfile!=null&& !mfile.isEmpty()) {
				logger.info("/board/write : "+mfile.getOriginalFilename());
				BoardUploadFile file = new BoardUploadFile();
				file.setBoardFileName(mfile.getOriginalFilename());
				file.setBoardFileSize(mfile.getSize());
				file.setBoardFileContentType(mfile.getContentType());
				file.setBoardFileData(mfile.getBytes());
				logger.info("/board/write : " +file.toString());
				
				boardService.insertArticle(board, file);
			}else {
				boardService.insertArticle(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		
		return "redirect:/board/"+board.getCategoryId()+"/"+1;
	}
	
	
	
}