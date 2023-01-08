package com.team01.myapp.subattendance.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="saFileData")
public class SubAttFile {
	private int saFileId;
	private String saFileName;
	private long saFileSize;
	private String saFileContentType;
	private byte[] saFileData;
	private int subAttNo;
}
