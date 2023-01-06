package com.team01.myapp.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.admin.model.ReasonList;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.board.model.BoardUploadFile;

public interface IAdminRepository {
	int selectMaxListNo();

	List<UserList> getUserListBySubject(@Param("start") int start, @Param("end") int end,
			@Param("subjectId") int subjectId);

	List<ReasonList> getReasonListbyResult(@Param("start") int start, @Param("end") int end,
			@Param("result") String result);

	// 쓰기 기능
	void insertUserFile(UserUploadFile file);

	int selectMaxFileId();
}
