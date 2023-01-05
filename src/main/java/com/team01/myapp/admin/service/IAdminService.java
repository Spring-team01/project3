package com.team01.myapp.admin.service;

import java.util.List;

import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.util.Pager;

public interface IAdminService {
	Pager returnPage(String pageNo, Pager pager);
	List<UserList> getUserListBySubject(int subjectId, Pager pager);
}
