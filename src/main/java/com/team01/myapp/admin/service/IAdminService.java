package com.team01.myapp.admin.service;

import java.util.List;

import com.team01.myapp.admin.model.ReasonList;
import com.team01.myapp.admin.model.User;
import com.team01.myapp.admin.model.UserList;
import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.util.Pager;

public interface IAdminService {
	Pager returnPage(String pageNo, Pager pager, int SubjectId);
	List<UserList> getUserListBySubject(int subjectId, Pager pager);
	List<ReasonList> getReasonListbyResult(String result, Pager pager);
	void insertUserFile(UserUploadFile file);
	User getUser(String userId);
	UserUploadFile getFile(String userFileId);
	void updateUser(User user, UserUploadFile file);
	void updateUser(User user);
}
