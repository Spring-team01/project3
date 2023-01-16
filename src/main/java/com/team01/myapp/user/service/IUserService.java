package com.team01.myapp.user.service;

import com.team01.myapp.admin.model.UserUploadFile; 
import com.team01.myapp.user.model.User;

public interface IUserService {	
	User selectUser(String userid);
	String getPassword(String userid);
	
	//학생 정보 수정
	User getUser(String userId);
	void updateUser(User user, UserUploadFile file);
	void updateUser(User user);
	
}