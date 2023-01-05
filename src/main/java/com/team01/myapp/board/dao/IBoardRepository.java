package com.team01.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardUploadFile;

public interface IBoardRepository {
	// 시퀀스 역할
	int selectMaxArticleNo();
	int selectMaxFileId();
	
	//리스트 기능 
	int selectTotalArticleCount();
	List<Board> selectTotalArticleList(@Param("start")int start, @Param("end") int end);

	int selectCategoryArticleCount(int categoryId);
	List<Board> selectArticleListByCategory(@Param("categoryId") int categoryId, @Param("start") int start, @Param("end") int end);
	
	//읽기 기능 
	void updateReadCount(int boardId);
	Board selectArticle(int boardId);
	BoardUploadFile getFile(int boardFileId);
	
	//쓰기 기능
	void insertArticle(Board board);
	void insertFileData(BoardUploadFile file);
	

	
}
