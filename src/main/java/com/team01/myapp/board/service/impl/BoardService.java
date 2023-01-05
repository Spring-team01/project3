package com.team01.myapp.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.myapp.board.dao.IBoardRepository;
import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.service.IBoardService;
import com.team01.myapp.community.model.Community;
import com.team01.myapp.util.Pager;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	IBoardRepository boardRepository;
	
	//모든 페이지 페이징처리
	@Override
	public Pager returnPage(String pageNo, Pager pager) {
		// pager
				int totalBoardNum = ((int)boardRepository.selectTotalArticleCount());
				
				if (pageNo == null) {
					pageNo = "1";
				}
				int pagerNo = Integer.parseInt(pageNo);
				pager = new Pager(5, 5, totalBoardNum, pagerNo);
		return pager;
	}
	
	//카테고리별 페이징처리 
	@Override
	public Pager returnCategoryPage(int categoryId, String pageNo, Pager pager) {
		// pager
				int totalBoardNum = ((int)boardRepository.selectCategoryArticleCount(categoryId));
				
				if (pageNo == null) {
					pageNo = "1";
				}
				int pagerNo = Integer.parseInt(pageNo);
				pager = new Pager(5, 5, totalBoardNum, pagerNo);
		return pager;
	}

	@Override
	public List<Board> getTotalArticleList(Pager pager) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		return boardRepository.selectTotalArticleList(start, end);
	}
	

	@Override
	public List<Board> getArticleListbyCategory(int categoryId, Pager pager) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
