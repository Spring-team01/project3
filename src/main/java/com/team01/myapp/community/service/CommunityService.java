package com.team01.myapp.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.myapp.community.dao.ICommunityRepository;
import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityFile;
@Service
public class CommunityService implements ICommunityService {
	
	@Autowired
	ICommunityRepository communityRepository;
	
	@Override
	public void writeCommunity(Community community) {
		
	}

	@Override
	public void insertFileData(CommunityFile communityFile) {

	}

	@Override
	public List<Community> getCommunityListByCategory() {
		return null;
	}

}
