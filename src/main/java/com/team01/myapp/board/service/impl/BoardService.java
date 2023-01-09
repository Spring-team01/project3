package com.team01.myapp.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.myapp.board.dao.IBoardRepository;
import com.team01.myapp.board.model.Board;
import com.team01.myapp.board.model.BoardComment;
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
	
	//검색별 페이징 처리
	@Override
	public Pager returnSearchPage(String keyword, String pageNo, Pager pager) {
		//pager
			String skeyword = "%"+keyword+"%";
			int totalBoardNum = ((int)boardRepository.selectSearchArticleCount(skeyword));
			
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
	@Override
	public List<Board> getSearchArticleList(String keyword, Pager pager){
		String skeyword = "%"+keyword+"%";
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		return boardRepository.selectSearchArticleList(skeyword, start, end);
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
	
	@Transactional
	public void deleteArticle(int boardId) {
		boardRepository.deleteFileData(boardId);
		boardRepository.deleteArticle(boardId);
	}
	
	//리플 리스트 불러오기
	@Override
	public List<BoardComment> getBoardComment(int boardId) {
		return boardRepository.selectBoardComment(boardId);
	}
	
	//리플 작성 
	@Override
	public void writeBoardReply(BoardComment comment) {
		comment.setBcReplyNo(boardRepository.selectMaxReplyNo()+1);
		boardRepository.insertComment(comment);
	}
	
	//대댓글 리스트 불러오기
	@Override
	public List<BoardComment> getNestedComment(int bcReplyNo) {
		return boardRepository.selectNestedComments(bcReplyNo);
	}
	
	//대댓글 작성 
	@Override
	public void writeNestedReply(BoardComment comment) {
		comment.setBcReplyNo(boardRepository.selectMaxReplyNo()+1);
		boardRepository.insertNestedComment(comment);
	}
	
	
}
