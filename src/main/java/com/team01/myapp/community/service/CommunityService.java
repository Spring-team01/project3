package com.team01.myapp.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team01.myapp.community.dao.ICommunityRepository;
import com.team01.myapp.community.model.Community;
import com.team01.myapp.community.model.CommunityFile;
import com.team01.myapp.util.Pager;

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

	@Override
	@Transactional
	public Community readCommunityDetail(int communityBoardId) {
		communityRepository.updateReadCount(communityBoardId);
		return communityRepository.readCommunityDetail(communityBoardId);
	}

	@Override
	public CommunityFile getFile(int communityCBoardId) {
		return communityRepository.getFile(communityCBoardId);
	}
	
	
}
