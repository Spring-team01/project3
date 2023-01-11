package com.team01.myapp.admin.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.myapp.admin.dao.IAdminRepository;
import com.team01.myapp.admin.model.AttSummaryVo;
import com.team01.myapp.admin.model.SubAttList;
import com.team01.myapp.admin.model.SubAttendance;
import com.team01.myapp.admin.model.User;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.util.Pager;

@Service
public class AdminService implements IAdminService {

	@Autowired
	IAdminRepository adminRepository;

	// 1. select
	// 과목별 학생 목록 조회
	@Override
	public Pager returnPage(String pageNo, Pager pager, int subjectId) {
		// 전체 행수
		int totalUserNum = adminRepository.selectTotalCategoryListNum(subjectId);
		if (pageNo == null) {
			pageNo = "1";
		}
		int pagerNo = Integer.parseInt(pageNo);
		pager = new Pager(5, 5, totalUserNum, pagerNo);
		return pager;
	}

	@Override
	public List<UserList> getUserListBySubject(int subjectId, Pager pager) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo() - 1) * pager.getRowsPerPage() + 1;

		return adminRepository.selectUserListBySubject(start, end, subjectId);
	}

	// 학생 상세 조회
	@Override
	public User getUser(String userId) {
		return adminRepository.selectUser(userId);
	}

	@Override
	public UserUploadFile getFile(String userFileId) {
		return adminRepository.selectFile(userFileId);
	}

	@Override
	public void insertUserFile(UserUploadFile file) {
		file.setUserId("000000001");
		file.setUserFileId(adminRepository.selectMaxFileId() + 1);
		adminRepository.insertUserFile(file);

	}

	@Override
	public void updateUser(User user) {
		adminRepository.updateUser(user);
	}

	@Override
	@Transactional
	public void updateUser(User user, UserUploadFile file) {
		adminRepository.updateUser(user);
		if (file != null && file.getUserFileName() != null && !file.getUserFileName().equals("")) {
			file.setUserId(user.getUserId());
			System.out.println("서비스" + file.getUserFileId());
			if (file.getUserFileSize() > 0) {
				adminRepository.updateFileData(file);
			} else {
				adminRepository.insertFileData(file);
			}
		}
	}

	@Override
	public SubAttendance selectSubAttendanceDetail(int subAttNo) {
		return adminRepository.selectSubAttendanceDetail(subAttNo);
	}

	@Override
	public Pager SubAttendanceListPage(String pageNo, Pager pager, int resultNum) {
		// 전체 행수
		int totalSubNum = adminRepository.selectTotalSubAttListByPNum(resultNum);
		/*
		 * if (pageNo == null) { pageNo = "1"; }
		 */
		int pagerNo = Integer.parseInt(pageNo);
		pager = new Pager(5, 5, totalSubNum, pagerNo);
		return pager;
	}

	@Override
	public List<SubAttList> getSubAttListbyRNum(int resultNum, Pager pager) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo() - 1) * pager.getRowsPerPage() + 1;
		return adminRepository.selectSubAttListbyRNum(start, end, resultNum);
	}

	@Transactional
	@Override
	public void updateStatus(SubAttendance subAttendance, int result) {
		int subAttNo = subAttendance.getSubAttNo();
		// 승인
		if (result == 1) {
			String subStatus = subAttendance.getSubStatus();
			Timestamp subAttTime = subAttendance.getSubAttTime();
			Timestamp subLeaveTime = subAttendance.getSubleaveTime();
			int attNo = subAttendance.getAttNo();
			adminRepository.updateAtt(attNo, subStatus, subAttTime, subLeaveTime);
		}
		// 승인 거절 상관없이 업데이트
		adminRepository.updateSubatt(result, subAttNo);

	}

	@Override
	public AttSummaryVo attsumMonthly(int subjectId) {
		return adminRepository.selectAttSumMonthly(subjectId);
	}

	@Override
	public AttSummaryVo attSumDaily(int subjectId) {
		AttSummaryVo attSummaryVo = adminRepository.selectAttSumDaily(subjectId);
		int totalCount = adminRepository.selectTotalCountBySubject(subjectId);
		return null;
	}

}
