package com.team01.myapp.board.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="bFileData")
public class BoardUploadFile {
	private int bFileId;
	private int bBoardId;
	private String bFileName;
	private long bFileSize;
	private String bFileContentType;
	private byte[] bFileData;
	private int boardId;

}
