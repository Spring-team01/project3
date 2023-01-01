package com.team01.myapp.board.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.service.IBoardService;

@Service
public class BoardService implements IBoardService {


	@Override
	public List<Board> selectList(int categoryId) {
		
		return null;
	}

	@Override
	public int selectTotalListCount() {
		
		return 0;
	}

}
