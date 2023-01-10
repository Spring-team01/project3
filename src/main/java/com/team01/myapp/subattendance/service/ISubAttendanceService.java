package com.team01.myapp.subattendance.service;

import java.util.List;

import com.team01.myapp.subattendance.model.SubAttFile;
import com.team01.myapp.subattendance.model.SubAttendance;
import com.team01.myapp.util.Pager;

public interface ISubAttendanceService {
	String selectCheckAttendance(String today, String userId);
	
	void insertAttendance(String attDate, String userId, int subjectId);
	
	int selectAttNo(String today, String userId);
	
	// 파일이 없을떄 insert 문 
	void insertSubAttendance(SubAttendance subAttendance);
	
	// 파일이 있을때 insrt 문 그전에 subAttNo를 가져와야 함.
	void insertSubAttendance(SubAttendance subAttendance, SubAttFile file);

	// 페이징 처리
	Pager returnPage(String pageNo, Pager pager, String userId);
	
	List<SubAttendance> getSubAttendanceList(Pager pager, String userId);

	SubAttendance selectSubAttendanceDetail(int subAttNo);
	
	SubAttFile getFile(int fileId);
	
	// 수정
	void updateSubAttendance(SubAttendance subAttendance);
	void updateSubAttendance(SubAttendance subAttendance, SubAttFile file);
	
	// 삭제
	void deleteSubAttendance(int subAttNo);
	void deleteSubAttendance(int subAttNo, int saFileId);
}
