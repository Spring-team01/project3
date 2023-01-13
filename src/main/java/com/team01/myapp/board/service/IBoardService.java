package com.team01.myapp.board.service;

import java.util.List;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardUploadFile;
import com.team01.myapp.board.model.Reports;
import com.team01.myapp.board.model.BoardComment;
import com.team01.myapp.util.Pager;

public interface IBoardService { 
	
	//리스트 
	Pager returnPage(String pageNo, Pager pager);
	List<Board> getTotalArticleList(Pager pager);
	
	//카테고리별 리스트 
	Pager returnCategoryPage(int categoryId, String pageNo, Pager pager);
	List<Board> getArticleListByCategory(int categoryId, Pager pager);
	
	//검색 리스트 
	Pager returnSearchPage(String keyword, String pageNo, Pager pager);
	List<Board> getSearchArticleList(String keyword, Pager pager);
	
	//읽기 
	Board selectArticle(int boardId);
	BoardUploadFile getFile(int boardFileId);
	
	//쓰기 
	void insertArticle(Board board);
	void insertArticle(Board board, BoardUploadFile file);
	
	//수정
	String getPassword(int boardId);
	void updateArticle(Board board, BoardUploadFile file);
	void updateArticle(Board board);
	
	//삭제
	void deleteArticle(int categoryId);
	
	//리플 
	List<BoardComment> getBoardComment(int boardId);
	void writeBoardReply(BoardComment comment);
	
	//대댓글 
	List<BoardComment> getNestedComment(int bcReplyNo);
	void writeNestedReply(BoardComment comment);
	
	//댓글삭제 
	void deleteComment(int bcReplyNo);
	void deleteNestedComment(int bcReplyNo);
	
	//메인 미니뷰 가져오기 
	List<Board> getBoardMiniList();
	
	//댓글 신고 
	void reportComment(Reports report);
	void reportNestedComment(Reports report);
	
	
	


	
	
	
	

}
