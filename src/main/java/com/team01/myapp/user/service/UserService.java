package com.team01.myapp.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.myapp.admin.model.UserUploadFile;
import com.team01.myapp.user.dao.IUserRepository;
import com.team01.myapp.user.model.User;

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
	public User getUser(String userId) {
		return userRepository.selectUser(userId);
	}
	
	//학생 정보 수정
	@Override
	public void updateUser(User user) {
		userRepository.updateUser(user);
	}

	@Override
	@Transactional
	public void updateUser(User user, UserUploadFile file) {
		userRepository.updateUser(user);
		if (file != null && file.getUserFileName() != null && !file.getUserFileName().equals("")) {
			file.setUserId(user.getUserId());
			userRepository.updateFileData(file);
		} else {
			userRepository.insertFileData(file);
		}

	}


	

}