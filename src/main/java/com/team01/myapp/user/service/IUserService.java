package com.team01.myapp.user.service;

import com.team01.myapp.user.User;
import com.team01.myapp.user.model.UserUpdate;

public interface IUserService {	
	User selectUser(String userid);
	String getPassword(String userid);
	UserUpdate getUpdateUser(String userId);
	
}