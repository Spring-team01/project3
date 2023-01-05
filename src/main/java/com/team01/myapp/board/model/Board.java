package com.team01.myapp.board.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class Board {
	private int boardId;
	private int categoryId;
	private String writer;
	private String email;
	private String password;
	private String title;
	private String content;
	private Date writeDate;
	private int readCount;
	private String userId;
	private int page;
	
	//file 게시판 입력양식에 file이 있다 spring에 multipartfile 임
	private MultipartFile file;
	//file정보들
	private int boardFileId;
	private String boardFileName;
	private long boardFileSize;
	private String boardFileContentType;
}
