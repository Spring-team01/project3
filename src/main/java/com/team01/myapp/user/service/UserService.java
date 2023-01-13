package com.team01.myapp.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.myapp.user.User;
import com.team01.myapp.user.dao.IUserRepository;
import com.team01.myapp.user.model.UserUpdate;

@Service
public class UserService implements IUserService {

	@Autowired
	IUserRepository userRepository;

	@Override
	public User selectUser(String userid) {
		return userRepository.selectUser(userid);
	}

	@Override
	public String getPassword(String userid) {
		return userRepository.getPassword(userid);
	}

	@Override
	public UserUpdate getUpdateUser(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

}