package com.team01.myapp.admin.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserInsert {
	
	private MultipartFile file;
	// file정보들
	private int userFileId;
	private String userFileName;
	private String userFileSize;
	private String userFileContentType;
	
}
