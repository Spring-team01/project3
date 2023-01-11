package com.team01.myapp.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team01.myapp.community.dao.ICommunityRepository;
import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityComment;
import com.team01.myapp.community.model.CommunityFile;
import com.team01.myapp.util.Pager;

@Service
public class CommunityService implements ICommunityService {

	@Autowired
	ICommunityRepository communityRepository;
	
	//글 작성
	@Override
	@Transactional
	public void writeCommunity(Community community) {
		community.setCommunityBoardId(communityRepository.selectMaxListNo() + 1);
		communityRepository.writeCommunity(community);
	}
	
	@Override
	@Transactional
	public void writeCommunity(Community community, CommunityFile file) {
		community.setCommunityBoardId(communityRepository.selectMaxListNo() + 1);
		communityRepository.writeCommunity(community);
		if(file != null && file.getCommunityFileName() != null && !file.getCommunityFileName().equals("")) {
			file.setCommunityCBoardId(community.getCommunityBoardId());
			file.setCommunityFileId(communityRepository.selectMaxFileId()+1);
			communityRepository.insertFileData(file);
		} 
	}
	//글 수정
	@Override
	@Transactional
	public void updateCommunity(Community community) {
		communityRepository.updateCommunity(community);
	}
	
	@Override
	@Transactional
	public void updateCommunity(Community community, CommunityFile file) {
		communityRepository.updateCommunity(community);
		
		if(file != null && file.getCommunityFileName() != null && !file.getCommunityFileName().equals("")) {
			file.setCommunityCBoardId(community.getCommunityBoardId());
			communityRepository.deleteFileData(community.getCommunityBoardId());
			
			if(file.getCommunityFileId()>0) {
				communityRepository.insertFileData(file);
			} else {
				file.setCommunityFileId(communityRepository.selectMaxFileId()+1);
				communityRepository.insertFileData(file);
			}
			
		} 
	}
	
	
	//게시판 리스트 가져오기
	@Override
	public List<Community> getCommunityListByCategory(int categoryId, Pager pager) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		return communityRepository.getCommunityListByCategory(start, end);
	}

	@Override
	public Pager returnPage(String pageNo, Pager pager) {
		// pager
				int totalBoardNum = ((int)communityRepository.selectMaxListNo());
				
				if (pageNo == null) {
					pageNo = "1";
				}
				int pagerNo = Integer.parseInt(pageNo);
				pager = new Pager(5, 5, totalBoardNum, pagerNo);
		return pager;
	}
	//게시글 상세 읽기
	@Override
	@Transactional
	public Community readCommunityDetail(int communityBoardId) {
		communityRepository.updateReadCount(communityBoardId);
		return communityRepository.readCommunityDetail(communityBoardId);
	}
	//댓글 리스트 가져오기
	@Override
	public List<CommunityComment> getCommunityComment(int communityBoardId) {
		return communityRepository.getCommunityCommentList(communityBoardId);
	}
	//파일 가져오기
	@Override
	public CommunityFile getFile(int communityBoardId) {
		return communityRepository.getFile(communityBoardId);
	}
	//댓글 달기
	@Override
	@Transactional
	public void writeCommunityReply(CommunityComment comment) {
		communityRepository.writeCommunityReply(comment);
		communityRepository.updateCommunityReplyNumber(comment.getCommunityBoardId());
		communityRepository.updateCommentMasterNumber(comment.getCommunityBoardId());
		
	}
	
	// 글 삭제
	@Override
	public String getPassword(int communityBoardId) {
		return communityRepository.getPassword(communityBoardId);
	}

	@Override
	@Transactional
	public void deleteCommunity(int communityBoardId) {
		communityRepository.deleteCommunity(communityBoardId);
		communityRepository.deleteFileData(communityBoardId);
	}
	
	@Override
	public Pager returnKeywordPager(String pageNo, String keyword, Pager pager) {
		String searchKeyword = "%" + keyword + "%";
		int totalBoardNum = ((int)communityRepository.selectSearchCommunity(searchKeyword));
		
		if(pageNo == null) {
			pageNo = "1";
		}
		int pagerNo = Integer.parseInt(pageNo);
		pager= new Pager(5, 5, totalBoardNum, pagerNo);
		return pager;
	}
	
	@Override
	public List<Community> searchListByContentKeyword(String keyword, Pager pager) {
		String searchKeyword = "%" + keyword + "%";
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		
		return communityRepository.selectSearchCommunityList(searchKeyword, start, end);
	}
	//댓글 수정
	@Override
	public void updateCommunityComment(CommunityComment comment) {
		
	}

	@Override
	public List<Community> readCountListByCategory(int categoryId) {
		return communityRepository.readCountListByCategory(categoryId);
	}

	@Override
	public List<CommunityComment> getReplyCommentList(int communityCommentMasterNumber) {
		return null;
	}

	
	

	
	
	
	
}
