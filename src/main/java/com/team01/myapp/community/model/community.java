package com.team01.myapp.community.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;
@Data
@ToString(exclude="file")
public class community {
	private int communityBoardId;
	private int communityCategoryId;
	private String communityEmail;
	private String communityPassword;
	private String communityTitle;
	private Date communityWriteDate;
	private int communityReadCount;
	private String usersId;
	private MultipartFile file;
	
	private int communityFileId;
	private String communityFileName;
	private String communityFileSize;
	private String communityContentType;
	
	
	
}
