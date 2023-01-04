package com.team01.myapp.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.myapp.board.dao.IBoardRepository;
import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.service.IBoardService;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	IBoardRepository boardRepository;
	
	
	@Override
	public int selectTotalArticleCount() {
		return boardRepository.selectTotalArticleCount();
	}

	@Override
	public List<Board> selectTotalArticleList(int page) {
		int start = (page-1) *10 + 1;
		return boardRepository.selectTotalArticleList(start, start+9);
	}
	

	@Override
	public List<Board> selectArticleListByCategory(int categoryId, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectTotalArticleCountByCategoryId(int categoryId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
