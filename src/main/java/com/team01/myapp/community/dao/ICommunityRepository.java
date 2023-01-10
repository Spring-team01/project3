package com.team01.myapp.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityComment;
import com.team01.myapp.community.model.CommunityFile;

public interface ICommunityRepository {
	
	int selectMaxListNo();
	int selectMaxFileId();
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
	void writeCommunityReply(CommunityComment comment);
	
	void deleteFileData(int communityBoardId);
	void deleteCommunity(int communityBoardId);
	String getPassword(int communityBoardId);
	
	int selectSearchCommunity(String keyword);
	List<Community> selectSearchCommunityList(@Param("keyword") String keyword, 
			@Param("start") int start, @Param("end") int end );
	List<Community>readCountListByCategory(int categoryId);
	
}
