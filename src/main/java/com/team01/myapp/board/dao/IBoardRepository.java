package com.team01.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardUploadFile;

public interface IBoardRepository {
	int selectMaxArticleNo();
	int selectMaxFileId();
	
	void insertArticle(Board board);
	void insertFileData(BoardUploadFile file);
	
	List<Board> selectArticleListByCategory(@Param("categoryId") int categoryId, @Param("start") int start, @Param("end") int end);
	
	int selectTotalArticleCount();
	int selectTotalArticleCountByCategoryId(int categoryId);
}
