package com.team01.myapp.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityComment;
import com.team01.myapp.community.model.CommunityFile;

public interface ICommunityRepository {
	
	int selectMaxListNo();
	int selectMaxFileId();
	int selectMaxReplyNum(int communityCommentMasterNumber);
	void writeCommunity(Community community);
	void insertFileData(CommunityFile communityFile);
	
	void updateCommunity(Community community);
	void updateFileData(CommunityFile communityFile);
	
	List<Community> getCommunityListByCategory(@Param("start") int start, @Param("end") int end);
	List<CommunityComment> getCommunityCommentList(int communityBoardId);
	
	void updateReadCount(int communityBoardId);
	Community readCommunityDetail(int communityBoardId);
	CommunityFile getFile(int communityBoardId);
	
	void updateCommunityReplyNumber(@Param("communityBoardId") int communityBoardId);
	void minusCommunityReplyNumber(@Param("communityBoardId") int communityBoardId);
	
	void writeCommunityReply(CommunityComment comment);
	
	void deleteFileData(int communityBoardId);
	void deleteCommunity(int communityBoardId);
	String getPassword(int communityBoardId);
	
	int selectSearchCommunity(String keyword);
	List<Community> selectSearchCommunityList(@Param("keyword") String keyword, 
			@Param("start") int start, @Param("end") int end );
	List<Community>readCountListByCategory(int categoryId);
	
	void updateCommentMasterNumber(int communityBoardId);
	
	List<CommunityComment> getReplyCommentList(@Param("communityCommentMasterNumber")int communityCommentMasterNumber
												,@Param("communityBoardId") int communityBoardId);
	
	void insertReplyCommunityComment(CommunityComment comment);
	void deleteCommunityReply(CommunityComment comment);
	void deleteCommunityReReplyComment(CommunityComment comment);
	
	//Mini view 탭 query
	List<Community> getCommunityListByTabNo2(int categoryId);
	List<Community> getCommunityListByTabNo3(int categoryId);
	
	//댓글 신고 기능
	void insertReportComment(CommunityComment comment);
	CommunityComment getCommentForReport(@Param("communityCommentNo")int communityCommentNo);
	
}
