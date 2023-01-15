package com.team01.myapp.admin.service;

import java.util.List;

import com.team01.myapp.admin.model.AttSumDailyVo;
import com.team01.myapp.admin.model.AttSummaryVo;
import com.team01.myapp.admin.model.Reports;
import com.team01.myapp.admin.model.SubAttList;
import com.team01.myapp.admin.model.SubAttendance;
import com.team01.myapp.admin.model.User;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.util.Pager;

public interface IAdminService {
	//과목별 학생 목록 조회
	Pager returnPage(String pageNo, Pager pager, int subjectId);
	List<UserList> getUserListBySubject(int subjectId, Pager pager);
	//학생 상세 조회
	User getUser(String userId);
	UserUploadFile getFile(String userFileId);
	//학생 정보 수정
	void updateUser(User user, UserUploadFile file);
	void updateUser(User user);
	//휴가 목록 조회
	Pager SubAttendanceListPage(String pageNo, int resultNum);
	List<SubAttList> getSubAttListbyRNum(int resultNum, Pager pager);
	//휴가 상세 조회
	SubAttendance selectSubAttendanceDetail(int subAttNo);
	//휴가 처리
	void updateStatus(SubAttendance subAttendance, int result);
	//전체 출결 조회
	AttSummaryVo attsumMonthly(int subjectId);
	AttSummaryVo attSumDaily(int subjectId);
	//학생 월별 출결조회
	List<AttSummaryVo> attsumMonthlyByuser(int subjectId);
	//학생 일별 출결조회
	List<AttSumDailyVo> attSumDailyByuser(int subjectId);
	//신고 목록 조회
	List<Reports> getReportList(int resultNum, Pager pager);
	Pager getReprtListPage(String pageNo, int resultNum);
	
	void insertUserFile(UserUploadFile file);
}
