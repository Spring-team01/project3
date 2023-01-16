package com.team01.myapp.user.dao;

import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.user.model.User;

public interface IUserRepository {	
	User selectUser(String userid);
	String getPassword(String userid);
	void updateUser(User user);
	void updateFileData(UserUploadFile file);
	void insertFileData(UserUploadFile file);
}