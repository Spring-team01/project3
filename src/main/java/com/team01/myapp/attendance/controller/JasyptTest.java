package com.team01.myapp.attendance.controller;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JasyptTest {
	public static void main(String[] args) {
		StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
		enc.setPassword("rktgmlfbf"); // 갓희률
		System.out.println(enc.encrypt("oracle.jdbc.OracleDriver"));
		System.out.println(enc.encrypt("jdbc:oracle:thin:@kosa402.iptime.org:50061/orcl"));
		System.out.println(enc.encrypt("team1"));
		System.out.println(enc.encrypt("oracle"));
	}
}
