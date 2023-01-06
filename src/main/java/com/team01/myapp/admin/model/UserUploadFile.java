package com.team01.myapp.admin.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="userFileData")
public class UserUploadFile {
	private int userFileId;
	private String userFileName;
	private long userFileSize;
	private String userFileContentType;
	private byte[] userFileData;
	private String userId;
}
