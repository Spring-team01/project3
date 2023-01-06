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
	
	List<Community> getCommunityListByCategory(@Param("start") int start, @Param("end") int end);
	List<CommunityComment> getCommunityCommentList(int communityBoardId);
	
	void updateReadCount(int communityBoardId);
	Community readCommunityDetail(int communityBoardId);
	CommunityFile getFile(int communityBoardId);
	
	void updateCommunityReplyNumber(@Param("communityBoardId") int communityBoardId);
	void writeCommunityReply(CommunityComment comment);
	
	
}
