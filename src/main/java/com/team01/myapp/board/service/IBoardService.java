package com.team01.myapp.board.service;

import java.util.List;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardUploadFile;
import com.team01.myapp.util.Pager;

public interface IBoardService { 
	
	//리스트 
	Pager returnPage(String pageNo, Pager pager);
	List<Board> getTotalArticleList(Pager pager);
	
	Pager returnCategoryPage(int categoryId, String pageNo, Pager pager);
	List<Board> getArticleListByCategory(int categoryId, Pager pager);
	
	//읽기 
	Board selectArticle(int boardId);
	BoardUploadFile getFile(int boardFileId);
	
	//쓰기 
	void insertArticle(Board board);
	void insertArticle(Board board, BoardUploadFile file);
	


	
	
	
	

}
