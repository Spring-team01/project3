package com.team01.myapp.admin.service;

import java.util.List;

import com.team01.myapp.admin.model.AttSumDailyVo;
import com.team01.myapp.admin.model.AttSummaryVo;
import com.team01.myapp.admin.model.SubAttList;
import com.team01.myapp.admin.model.SubAttendance;
import com.team01.myapp.admin.model.User;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.util.Pager;

public interface IAdminService {
	Pager returnPage(String pageNo, Pager pager, int subjectId);
	List<UserList> getUserListBySubject(int subjectId, Pager pager);
	List<SubAttList> getSubAttListbyRNum(int resultNum, Pager pager);
	void insertUserFile(UserUploadFile file);
	User getUser(String userId);
	UserUploadFile getFile(String userFileId);
	void updateUser(User user, UserUploadFile file);
	void updateUser(User user);
	SubAttendance selectSubAttendanceDetail(int subAttNo);
	Pager SubAttendanceListPage(String pageNo, int resultNum);
	void updateStatus(SubAttendance subAttendance, int result);
	AttSummaryVo attsumMonthly(int subjectId);
	AttSummaryVo attSumDaily(int subjectId);
	List<AttSummaryVo> attsumMonthlyByuser(int subjectId);
	List<AttSumDailyVo> attSumDailyByuser(int subjectId);
}
