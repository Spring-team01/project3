package com.team01.myapp.board.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="boardFileData")
public class BoardUploadFile {
	private int boardFileId;
	private String boardFileName;
	private long boardFileSize;
	private String boardFileContentType;
	private byte[] boardFileData;
	private int boardId;

}
