package com.team01.myapp.user.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="file")
public class UserUpdate {
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
	
	private MultipartFile file;

	private int userFileId;
	private String userFileName;
	private long userFileSize;
	private String userFileContentType;
	
	
	
	
}
