package com.team01.myapp.community.service;

import java.util.List;

import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityFile;

public interface ICommunityService {
	
	void writeCommunity(Community community);
	void insertFileData(CommunityFile communityFile);
	
	List<Community> getCommunityListByCategory();
	
	
}
