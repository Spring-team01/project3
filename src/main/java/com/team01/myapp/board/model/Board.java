package com.team01.myapp.board.model;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

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
	private int masterId;
	private String uId;
}
