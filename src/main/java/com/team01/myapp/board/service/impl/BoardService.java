package com.team01.myapp.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.myapp.board.dao.IBoardRepository;
import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardUploadFile;
import com.team01.myapp.board.service.IBoardService;
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
	//리스트 가져오기 
	@Override
	public List<Board> getTotalArticleList(Pager pager) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		return boardRepository.selectTotalArticleList(start, end);
	}
	

	@Override
	public List<Board> getArticleListByCategory(int categoryId, Pager pager) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		return boardRepository.selectArticleListByCategory(categoryId, start, end);
	}
	//읽기 
	@Override
	public Board selectArticle(int boardId) {
		boardRepository.updateReadCount(boardId);
		return boardRepository.selectArticle(boardId);
	}

	@Override
	public BoardUploadFile getFile(int boardFileId) {
		return boardRepository.getFile(boardFileId);
	}
	
	//쓰기 
	@Transactional
	public void insertArticle(Board board) {
		board.setBoardId(boardRepository.selectMaxArticleNo()+1);
		boardRepository.insertArticle(board);
	}
	

	@Transactional
	public void insertArticle(Board board, BoardUploadFile file) {
		board.setBoardId(boardRepository.selectMaxArticleNo()+1);
		boardRepository.insertArticle(board);
		if(file != null && file.getBoardFileName() != null && !file.getBoardFileName().equals("")) {
			file.setBoardId(board.getBoardId());
			file.setBoardFileId(boardRepository.selectMaxFileId()+1);
			boardRepository.insertFileData(file);
		}
		
	}

	@Override
	public String getPassword(int boardId) {
		return boardRepository.getPassword(boardId);
	}

	@Override
	public void updateArticle(Board board) {
		boardRepository.updateArticle(board);
	}

    @Transactional
	public void updateArticle(Board board, BoardUploadFile file) {
		boardRepository.updateArticle(board);
		if(file !=null && file.getBoardFileName() !=null && !file.getBoardFileName().equals("")){
			file.setBoardId(board.getBoardId());
			if(file.getBoardFileId()>0) {
				boardRepository.updateFileData(file);
			}else {
				file.setBoardFileId(boardRepository.selectMaxFileId()+1);
				boardRepository.insertFileData(file);
			}
		}
	}
    
    // 삭제   
	@Override
	public Board selectDeleteArticle(int boardId) {
		return boardRepository.selectDeleteArticle(boardId);
	}
	
	@Transactional
	public void deleteArticle(int boardId) {
		boardRepository.deleteFileData(boardId);
		boardRepository.deleteArticle(boardId);
	}
	
}
