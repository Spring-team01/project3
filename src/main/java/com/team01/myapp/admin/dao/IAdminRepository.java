package com.team01.myapp.admin.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.admin.model.AttSumDailyVo;
import com.team01.myapp.admin.model.AttSummaryVo;
import com.team01.myapp.admin.model.Names;
import com.team01.myapp.admin.model.Reports;
import com.team01.myapp.admin.model.SubAttList;
import com.team01.myapp.admin.model.SubAttendance;
import com.team01.myapp.admin.model.User;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;

public interface IAdminRepository {
	int selectTotalCategoryListNum(@Param("subjectId") int subjectId);

	List<UserList> selectUserListBySubject(@Param("start") int start, @Param("end") int end,
			@Param("subjectId") int subjectId);

	User selectUser(@Param("userId") String userId);
	
	UserUploadFile selectFile(@Param("userFileId") String userFileId);
	
	List<SubAttList> selectSubAttListbyRNum(@Param("start") int start, @Param("end") int end,
			@Param("resultNum") int resultNum);

	int selectMaxFileId();
	
	void insertUserFile(UserUploadFile file);

	void updateUser(User user);

	void updateFileData(UserUploadFile file);

	void insertFileData(UserUploadFile file);

	SubAttendance selectSubAttendanceDetail(int subAttNo);

	int selectTotalSubAttListByPNum(int resultNum);

	void updateSubatt(@Param("result") int result, @Param("subAttNo")int subAttNo);

	void updateAtt(@Param("attNo")int attNo,@Param("subStatus")String subStatus, @Param("subAttTime")Timestamp subAttTime,  
			@Param("subLeaveTime")Timestamp subLeaveTime);

	AttSummaryVo selectAttSumMonthly(@Param("subjectId")int subjectId);

	AttSummaryVo selectAttSumDaily(@Param("subjectId")int subjectId);

	int selectTotalCountBySubject(int subjectId);

	List<Integer> selectUserIdsBySub(int subjectId);

	AttSummaryVo selectSumByuser(int userId);

	AttSumDailyVo selectSumDailyByuser(int userId);

	Names selectNames(int userId);

	AttSummaryVo selectSumByuser(@Param("userId")int userId, @Param("subjectId")int subjectId);
	
	//리포트 리스트 갯수 가져오기
	int selectTotalReportCountByPNum(int resultNum);
	List<Reports> selectTotalReportList(@Param("start") int start, @Param("end") int end, @Param("resultNum") int resultNum);

	void updateReportStatus(int rpReportNo);
}
