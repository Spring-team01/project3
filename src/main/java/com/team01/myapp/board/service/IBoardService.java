package com.team01.myapp.board.service;

import java.util.List;

import com.team01.myapp.board.model.Board;

public interface IBoardService { 
	
	List<Board> selectTotalArticleList(int page);
	int selectTotalArticleCount();
	
	List<Board> selectArticleListByCategory(int categoryId, int page);
	int selectTotalArticleCountByCategoryId(int categoryId);

}
