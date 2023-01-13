package com.team01.myapp.subattendance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.myapp.subattendance.controller.SubattendanceController;
import com.team01.myapp.subattendance.dao.ISubAttendanceRepository;
import com.team01.myapp.subattendance.model.SubAttFile;
import com.team01.myapp.subattendance.model.SubAttendance;
import com.team01.myapp.subattendance.service.ISubAttendanceService;
import com.team01.myapp.util.Pager;

@Service
public class SubAttendanceService implements ISubAttendanceService {
	
	@Autowired
	ISubAttendanceRepository SubAttendanceRepository;
	
	@Override
	public int selectAttNo(String today, String userId) {
		return SubAttendanceRepository.selectAttNo(today, userId);
	}

	@Override
	public String selectCheckAttendance(String today, String userId) {
		return SubAttendanceRepository.selectCheckAttendance(today, userId);
	}

	@Override
	public void insertAttendance(String attDate, String userId, int subjectId) {
		SubAttendanceRepository.insertAttendance(attDate, userId, subjectId);
	}

	@Override
	public void insertSubAttendance(SubAttendance subAttendance) {
		SubAttendanceRepository.insertSubAttendance(subAttendance);
	}
	
	@Transactional
	public void insertSubAttendance(SubAttendance subAttendance, SubAttFile file) {
		SubAttendanceRepository.insertSubAttendance(subAttendance);
		
		if(file != null && file.getSaFileName() != null && !file.getSaFileName().equals("")) {
			int SubAttNo = SubAttendanceRepository.selectSubattNo(subAttendance.getAttNo(), subAttendance.getSubAttendanceTitle());
			file.setSubAttNo(SubAttNo);
			SubAttendanceRepository.insertSubAttendanceFileData(file);
		}
	}
	
	@Override
	public Pager returnPage(String pageNo, Pager pager, String userId) {
		// pager
				int totalBoardNum = ((int) SubAttendanceRepository.selectTotalsubAttendanceCount(userId));
				
				if (pageNo == null) {
					pageNo = "1";
				}
				int pagerNo = Integer.parseInt(pageNo);
				pager = new Pager(10, 5, totalBoardNum, pagerNo);
		return pager;
	}

	@Override
	public List<SubAttendance> getSubAttendanceList(Pager pager, String userId) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		return SubAttendanceRepository.selectAttendanceList(start, end, userId);
	}

	@Override
	public SubAttendance selectSubAttendanceDetail(int subAttNo) {
		return SubAttendanceRepository.selectSubAttendanceDetail(subAttNo);
	}
	
	@Override
	public SubAttFile getFile(int fileId) {
		return SubAttendanceRepository.getFile(fileId);
	}
	
	@Override
	public void updateSubAttendance(SubAttendance subAttendance) {
		SubAttendanceRepository.updateSubAttendance(subAttendance);
	}
	
	@Transactional
	public void updateSubAttendance(SubAttendance subAttendance, SubAttFile file) {
		SubAttendanceRepository.updateSubAttendance(subAttendance);
		if(file != null && file.getSaFileName() != null && !file.getSaFileName().equals("")) {
			file.setSaFileId(subAttendance.getFileId());
			if(file.getSaFileId()>0) {
				SubAttendanceRepository.updateFileData(file);
			} else {
				SubAttendanceRepository.insertSubAttendanceFileData(file);
			}
		}
	}
	
	@Override
	public void deleteSubAttendance(int subAttNo) {
		SubAttendanceRepository.deleteSubAttendance(subAttNo);
	}
	
	@Transactional
	public void deleteSubAttendance(int subAttNo, int saFileId) {
		SubAttendanceRepository.deleteSubAttendance(subAttNo);
		SubAttendanceRepository.deleteSubAttFile(saFileId);
	}
}
