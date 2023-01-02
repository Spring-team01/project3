package com.team01.myapp.board.service;

import java.util.List;

import com.team01.myapp.board.model.Board;

public interface IBoardService { 
	
	List<Board> selectList(int categoryId);
	
	int selectTotalListCount();

}
