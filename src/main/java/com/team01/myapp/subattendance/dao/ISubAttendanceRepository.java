package com.team01.myapp.subattendance.dao;

import org.apache.ibatis.annotations.Param;

public interface ISubAttendanceRepository {
	int selectAttNo(@Param("today") String today, @Param("userId") String userId);
}
