package com.team01.myapp.community.dao;

import java.util.List;

import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityFile;

public interface ICommunityRepository {
	
	int selectMaxListNo();
	int selectMaxFileId();
	void writeCommunity(Community community);
	void insertFileData(CommunityFile communityFile);
	
	List<Community> getCommunityListByCategory();
	
}
