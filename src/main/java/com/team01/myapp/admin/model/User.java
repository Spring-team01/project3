package com.team01.myapp.admin.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="file")
public class User {
	private String userId;
	private String userName;
	private String major;
	private int grade;
	private String phone;
	private String userType;
	private String password;
	private String email;
	private int subjectId;
	private String subjectName;
	
	//유저 프로필 사진 정보 가져오기
	private MultipartFile file;

	private int userFileId;
	private String userFileName;
	private long userFileSize;
	private String userFileContentType;
	
	
	
	
}
