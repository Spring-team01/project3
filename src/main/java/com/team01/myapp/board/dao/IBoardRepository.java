package com.team01.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardUploadFile;

public interface IBoardRepository {
//	int selectMaxArticleNo();
//	int selectMaxFileId();
	
	void insertArticle(Board board);
	void insertFileData(BoardUploadFile file);
	
	int selectTotalArticleCount();
	List<Board> selectTotalArticleList(@Param("start")int start, @Param("end") int end);

	int selectCategoryArticleCount(int categoryId);
	List<Board> selectArticleListByCategory(@Param("categoryId") int categoryId, @Param("start") int start, @Param("end") int end);
	
	//읽기 기능 
	void updateReadCount(int boardId);
	Board selectArticle(int boardId);
	BoardUploadFile getFile(int fileId);
	

	
}
