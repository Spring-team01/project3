package com.team01.myapp.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.myapp.admin.dao.IAdminRepository;
import com.team01.myapp.admin.model.ReasonList;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.util.Pager;
@Service
public class AdminService implements IAdminService {
	
	@Autowired
	IAdminRepository adminRepository;
	
	@Override
	public Pager returnPage(String pageNo, Pager pager) {
		// pager
		int totalUserNum = ((int)adminRepository.selectMaxListNo());
		
		if (pageNo == null) {
			pageNo = "1";
		}
		int pagerNo = Integer.parseInt(pageNo);
		pager = new Pager(10, 3, totalUserNum, pagerNo);
		return pager;
	}

	@Override
	public List<UserList> getUserListBySubject(int subjectId, Pager pager) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		return adminRepository.getUserListBySubject(start, end, subjectId);
	}

	@Override
	public List<ReasonList> getReasonListbyResult(String result, Pager pager) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		return adminRepository.getReasonListbyResult(start, end, result);
	}

	@Override
	public void insertUserFile(UserUploadFile file) {
		file.setUserId("201668001");
		file.setUserFileId(adminRepository.selectMaxFileId()+1);
		adminRepository.insertUserFile(file);
		
	}

}
