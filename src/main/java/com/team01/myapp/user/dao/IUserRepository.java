package com.team01.myapp.user.dao;

import com.team01.myapp.user.User;

public interface IUserRepository {	
	User selectUser(String userid);
	String getPassword(String userid);
}