package com.team01.myapp.admin.dao;

import java.util.List; 

import org.apache.ibatis.annotations.Param;

import com.team01.myapp.admin.model.UserList;

public interface IAdminRepository {
	int selectMaxListNo();
	List<UserList> getUserListBySubject(@Param("start") int start, @Param("end") int end, @Param("subjectId") int subjectId);
}
