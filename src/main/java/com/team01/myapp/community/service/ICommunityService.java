package com.team01.myapp.community.service;

import java.util.List;

import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityComment;
import com.team01.myapp.community.model.CommunityFile;
import com.team01.myapp.util.Pager;

public interface ICommunityService {
	
	void writeCommunity(Community community);
	void writeCommunity(Community community, CommunityFile file);
	void updateCommunity(Community community);
	void updateCommunity(Community community, CommunityFile file);
	void deleteCommunity(int communityBoardId);
	String getPassword(int communityBoardId);
	
	Pager returnPage(String pageNo, Pager pager);
	Pager returnKeywordPager(String pageNo, String keyword, Pager pager);
	List<Community> getCommunityListByCategory(int categoryId, Pager pager);
	List<CommunityComment> getCommunityComment(int communityBoardId);
	
	Community readCommunityDetail(int communityBoardId);
	CommunityFile getFile(int communityCBoardId);
	
	
	void writeCommunityReply(CommunityComment comment);
	
	
	List<Community> searchListByContentKeyword(String keyword, Pager pager);
	
	void updateCommunityComment(CommunityComment comment);
	
	List<Community> readCountListByCategory(int categoryId);
	
	List<CommunityComment> getReplyCommentList(int communityCommentMasterNumber, 
					int communityBoardId);
	
	void insertReplyCommunityComment(CommunityComment comment);
	void deleteCommunityReply(CommunityComment comment);
	void deleteCommunityReReplyComment(CommunityComment comment);
	
	//Mini view 탭 query
	List<Community> getCommunityListByTabNo2(int categoryId);
	List<Community> getCommunityListByTabNo3(int categoryId);
	
	//댓글 신고 기능
	void reportComment(CommunityComment comment);
	
	//댓글 조회
	CommunityComment getComment(int rpCommentNo);
}
