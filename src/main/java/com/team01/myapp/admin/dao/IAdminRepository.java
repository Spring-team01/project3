package com.team01.myapp.admin.dao;

import java.util.List; 

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.admin.model.ReasonList;
import com.team01.myapp.admin.model.User;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.admin.model.SubAttendance;

public interface IAdminRepository {
	int selectTotalCategoryListNum(@Param("subjectId") int subjectId);

	List<UserList> selectUserListBySubject(@Param("start") int start, @Param("end") int end,
			@Param("subjectId") int subjectId);

	User selectUser(@Param("userId") String userId);
	
	UserUploadFile selectFile(@Param("userFileId") String userFileId);
	
	List<ReasonList> getReasonListbyResult(@Param("start") int start, @Param("end") int end,
			@Param("result") String result);

	int selectMaxFileId();
	
	void insertUserFile(UserUploadFile file);

	void updateUser(User user);

	void updateFileData(UserUploadFile file);

	void insertFileData(UserUploadFile file);

	SubAttendance selectSubAttendanceDetail(int subAttNo);
	


}
