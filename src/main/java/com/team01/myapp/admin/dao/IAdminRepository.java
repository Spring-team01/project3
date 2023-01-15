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
	// 과목별 학생 목록 조회
	int selectTotalCategoryListNum(@Param("subjectId") int subjectId);
	List<UserList> selectUserListBySubject(@Param("start") int start, @Param("end") int end,
			@Param("subjectId") int subjectId);

	// 학생 상세 조회
	User selectUser(@Param("userId") String userId);
	UserUploadFile selectFile(@Param("userFileId") String userFileId);

	// 학생 정보 수정
	void updateUser(User user);
	void updateFileData(UserUploadFile file);
	
	//휴가 목록 조회
	int selectTotalSubAttListByPNum(int resultNum);
	List<SubAttList> selectSubAttListbyRNum(@Param("start") int start, @Param("end") int end,
			@Param("resultNum") int resultNum);
	//휴가 상세 조회
	SubAttendance selectSubAttendanceDetail(int subAttNo);

	//휴가 처리
	void updateSubatt(@Param("result") int result, @Param("subAttNo") int subAttNo);
	void updateAtt(@Param("attNo") int attNo, @Param("subStatus") String subStatus,
			@Param("subAttTime") Timestamp subAttTime, @Param("subLeaveTime") Timestamp subLeaveTime);

	//전체 출결 조회
	AttSummaryVo selectAttSumMonthly(@Param("subjectId") int subjectId);
	AttSummaryVo selectAttSumDaily(@Param("subjectId") int subjectId);
	int selectTotalCountBySubject(int subjectId);
	
	//학생별 출결조회
	List<Integer> selectUserIdsBySub(int subjectId);
	AttSummaryVo selectSumByuser(int userId);
	AttSumDailyVo selectSumDailyByuser(int userId);
	Names selectNames(int userId);
	AttSummaryVo selectSumByuser(@Param("userId") int userId, @Param("subjectId") int subjectId);

	// 리포트 리스트 갯수 가져오기
	int selectTotalReportCountByPNum(int resultNum);
	List<Reports> selectTotalReportList(@Param("start") int start, @Param("end") int end,
			@Param("resultNum") int resultNum);
	
	//뭔지머르는 애들
	void insertUserFile(UserUploadFile file);
	void insertFileData(UserUploadFile file);
	int selectMaxFileId();
}
