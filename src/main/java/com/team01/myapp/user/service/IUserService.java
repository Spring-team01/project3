package com.team01.myapp.user.service;

import com.team01.myapp.user.User;

public interface IUserService {	
	User selectUser(String userid);
	String getPassword(String userid);
}