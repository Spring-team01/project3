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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.myapp.admin.model.Reports;
import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardComment;
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
		int subjectId = (Integer) session.getAttribute("subjectId");
		pager = boardService.returnPage(pageNo, pager, subjectId);
		String subjectName = boardService.selectSubjectName(subjectId);
		
		List<Board> boardList = boardService.getTotalArticleList(pager, subjectId);
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager",pager);
		
		return "board/list";
		
	}
	//카테고리별 리스트 가져오기
	@RequestMapping(value="/board/{categoryId}/{pageNo}",  method = RequestMethod.GET)
	public String getListByCategory(@PathVariable int categoryId, @PathVariable String pageNo, HttpSession session, Model model, Pager pager) {
		
		int subjectId = (Integer) session.getAttribute("subjectId");
		String subjectName = boardService.selectSubjectName(subjectId);

		pager = boardService.returnCategoryPage(categoryId, pageNo, pager, subjectId);
		List<Board> boardList = boardService.getArticleListByCategory(categoryId,pager, subjectId);
		
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager",pager);
		
		return "board/list";
	}

	//읽기
	@RequestMapping("/board/view/{boardId}/{pageNo}")
	public String getBoardDetails(@PathVariable int boardId, @PathVariable int pageNo, Model model) {
		Board board = boardService.selectArticle(boardId);
		List<BoardComment> commentList = boardService.getBoardComment(boardId);
	
		model.addAttribute("board", board);
		model.addAttribute("page", pageNo);
		model.addAttribute("commentList", commentList);
		model.addAttribute("categoryId", board.getCategoryId());
		logger.info("getBoardDetails" +board.toString());
		logger.info("getBoardDetails" +commentList.toString());
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
	
	//메인 미니 뷰(4개짜리)
	@RequestMapping("/board/boardminiview")
	public String getBoardMiniView(HttpSession session, Model model) {
		List<Board> boardMiniList = boardService.getBoardMiniList();
		model.addAttribute("boardMiniList", boardMiniList);
		return "board/boardMiniView";
	}

	//쓰기 
	@RequestMapping(value="/board/write/{categoryId}", method=RequestMethod.GET)
	public String writeArticle(@PathVariable int categoryId, Model model ) {
		model.addAttribute("categoryId", categoryId);
		return "board/write";
	}
	
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String writeArticle(Board board, BindingResult result, RedirectAttributes redirectAttrs,HttpSession session) {
		logger.info("/board/write: " +board.toString());
		try {
			board.setTitle(Jsoup.clean(board.getTitle(), Whitelist.basic()));
			String content = board.getContent();
			content = content.replace("\r\n", "<br>");
			content = content.replace("\r", "<br>");
			content = content.replace("\n", "<br>");
			board.setContent(Jsoup.clean(content, Whitelist.basic()));
			
			board.setSubjectId((Integer) session.getAttribute("subjectId")); 
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
	
	//수정
	@RequestMapping(value="/board/update/{boardId}", method=RequestMethod.GET)
	public String updateArticle(@PathVariable int boardId, Model model) {
		Board board =boardService.selectArticle(boardId);
		model.addAttribute("userId", board.getUserId());
		model.addAttribute("categoryId",board.getCategoryId());
		model.addAttribute("board",board);
		return "board/update";
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String updateArticle(Board board, BindingResult result, RedirectAttributes redirectAttrs, HttpSession session) {
		logger.info("/board/update " + board.toString());
		try {
			board.setTitle(Jsoup.clean(board.getTitle(), Whitelist.basic()));
			
			String content = board.getContent();
			content = content.replace("\r\n", "<br>");
			content = content.replace("\r", "<br>");
			content = content.replace("\n", "<br>");
			board.setContent(Jsoup.clean(content, Whitelist.basic()));
			MultipartFile mfile = board.getFile();
			if(mfile!=null&&!mfile.isEmpty()) {
				logger.info("/board/update: "+mfile.getOriginalFilename());
				BoardUploadFile file = new BoardUploadFile();
				file.setBoardFileName(mfile.getOriginalFilename());
				file.setBoardFileSize(mfile.getSize());
				file.setBoardFileId(board.getBoardFileId());
				file.setBoardFileContentType(mfile.getContentType());
				file.setBoardFileData(mfile.getBytes());
				logger.info("/board/update : "+ file.toString());
				
				boardService.updateArticle(board, file);
			}else {
				boardService.updateArticle(board);
				logger.info("/board/update " + board.toString());
			}
		}catch(Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/board/view/"+board.getBoardId()+"/"+board.getCategoryId();
	}
	
	//삭제
	@RequestMapping(value="/board/delete/{boardId}", method=RequestMethod.GET)
	public String deleteArticle(@PathVariable int boardId, Model model) {
		
		Board board =boardService.selectArticle(boardId);
		try {
			boardService.deleteArticle(board.getBoardId());
			model.addAttribute("boardId",boardId);
			model.addAttribute("categoryId",board.getCategoryId());
			return "redirect:/board/"+board.getCategoryId()+"/1";
		}catch(Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "redirect:/board/"+board.getCategoryId()+"/1";
		}
	}
	
	
	//관리자 삭제
	@RequestMapping(value="/board/admin/delete/{boardId}", method=RequestMethod.GET)
	public @ResponseBody String deleteAdminArticle(@PathVariable int boardId, Model model) {
		Board board =boardService.selectArticle(boardId);
		try {
			boardService.deleteArticle(board.getBoardId());
			return "1";
		}catch(Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "1";
			
		}
	}
	
	
	//검색
	@RequestMapping("/board/search/{pageNo}")
	public String search(@RequestParam(required=false, defaultValue="") String keyword, @PathVariable String pageNo, HttpSession session, Model model, Pager pager) {
		try {
			int subjectId = (Integer) session.getAttribute("subjectId");
			String subjectName = boardService.selectSubjectName(subjectId);
			
			pager = boardService.returnSearchPage(keyword, pageNo, pager,subjectId);
			List<Board> boardList = boardService.getSearchArticleList(keyword, pager, subjectId);
			
			model.addAttribute("subjectName", subjectName);
			model.addAttribute("boardList", boardList);
			model.addAttribute("pager", pager);
			model.addAttribute("keyword", keyword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "board/search";
	}
	
	//댓글 작성 기능 
	@RequestMapping(value="/board/comment", method = RequestMethod.POST) 
	public String writeBoardReply(Board board, BoardComment comment, BindingResult result, RedirectAttributes redirectAttrs,
			HttpSession session) {
			logger.info("/board/comment " + comment.toString());
			comment.setUserId((String) session.getAttribute("userId"));	
			boardService.writeBoardReply(comment);
			System.out.println(comment);
		return "redirect:/board/view/"+board.getBoardId()+"/"+board.getCategoryId();
	}
	
	//댓글 삭제 기능
	@RequestMapping(value="/board/comment/delete/{bcReplyNo}", method=RequestMethod.GET)
	public @ResponseBody String deleteComment(@PathVariable int bcReplyNo, Model model) {
		boardService.deleteComment(bcReplyNo);
		return "1";
	}
	
	//대댓글 읽기 기능
	@RequestMapping(value="/board/reply", method=RequestMethod.GET)
	public String viewNestedReply(@RequestParam int bcReplyNo, Model model) {
		List<BoardComment> nestedCommentList = boardService.getNestedComment(bcReplyNo);
		model.addAttribute("nestedCommentList", nestedCommentList);
		return "board/reply";                             
	}
	
	//대댓글 작성 기능 
	@RequestMapping(value="/board/reply/write", method = RequestMethod.POST) 
	public @ResponseBody String writeNestedReply(BoardComment comment, BindingResult result, HttpSession session) {
		logger.info("/board/reply/write/" + comment.toString());
		comment.setUserId((String) session.getAttribute("userId"));	
		boardService.writeNestedReply(comment);
	return "1";
	}
	
	//대댓글 삭제 기능
	@RequestMapping(value="/board/nestedcomment/delete/{bcReplyNo}", method=RequestMethod.GET)
	public @ResponseBody String deleteNestedComment(@PathVariable int bcReplyNo, Model model) {
		boardService.deleteNestedComment(bcReplyNo);
		return "1";
	}
	
	//댓글 신고 기능
	@RequestMapping("/board/comment/report")
	public @ResponseBody String reportComment(Reports report, BindingResult result, HttpSession session) {
		report.setUserId((String)session.getAttribute("userId"));
		boardService.reportComment(report);
		return "1";
	}
	
	
	
}