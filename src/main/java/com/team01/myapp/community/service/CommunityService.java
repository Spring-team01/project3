package com.team01.myapp.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.team01.myapp.community.dao.ICommunityRepository;
import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityFile;
@Service
public class CommunityService implements ICommunityService {
	
	@Autowired
	ICommunityRepository communityRepository;
	
	@Override
	@Transactional
	public void writeCommunity(Community community) {
		community.setCommunityBoardId(communityRepository.selectMaxListNo() + 1);
		communityRepository.writeCommunity(community);
	}

	@Override
	public void insertFileData(CommunityFile communityFile) {

	}

	@Override
	public List<Community> getCommunityListByCategory(int categoryId) {
		return communityRepository.getCommunityListByCategory(categoryId);
	}

}
