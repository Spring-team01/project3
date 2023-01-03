package com.team01.myapp.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.myapp.user.User;
import com.team01.myapp.user.dao.IUserRepository;



@Service
public class UserService implements IUserService {

	@Autowired
	IUserRepository userDao;

	@Override
	public User selectUser(String userid) {
		return userDao.selectUser(userid);
	}

	@Override
	public String getPassword(String userid) {
		return userDao.getPassword(userid);
	}
	
	

}