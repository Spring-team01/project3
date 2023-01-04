package com.team01.myapp.community.service;

import java.util.List;

import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityFile;
import com.team01.myapp.util.Pager;

public interface ICommunityService {
	
	void writeCommunity(Community community);
	void insertFileData(CommunityFile communityFile);
	Pager returnPage(String pageNo, Pager pager);
	
	List<Community> getCommunityListByCategory(int categoryId, Pager pager);
	
	
}
