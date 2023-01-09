package com.team01.myapp.subattendance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.subattendance.model.SubAttFile;
import com.team01.myapp.subattendance.model.SubAttendance;

public interface ISubAttendanceRepository {
	
	// 휴가신청시 행이 있는지 체크
	String selectCheckAttendance(@Param("today") String today, @Param("userId") String userId);
	
	// 휴가 신청시 행이 없다면 행을 추가해주는 insert 문
	void insertAttendance(@Param("attDate") String attDate, @Param("userId") String userId, @Param("subjectId") int subjectId);
	
	int selectAttNo(@Param("today") String today, @Param("userId") String userId);
	
	// 휴가 신청 insert 문
	void insertSubAttendance(SubAttendance subAttendance);
	
	// 휴가 신청 시 파일이 있으면 파일에 들어갈 SubAttNo를 읽어오기 위한 select 문
	int selectSubattNo(@Param("attNo") int attNo, @Param("subAttendanceTitle") String subAttendanceTitle);
	
	// 파일 insert
	void insertSubAttendanceFileData(SubAttFile subAttFile);
	
	// 페이징 처리
	int selectTotalsubAttendanceCount(String userId);
	
	List<SubAttendance> selectAttendanceList(@Param("start") int start, @Param("end") int end, @Param("userId") String userId);
}
