package com.project.proto.dto;

import java.sql.Timestamp;

	public class board1Dto {
		int num;
		String writer;
		String subject;
		String content;
		String pass;
		int readcount;
		Timestamp regdate;
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		public Timestamp getRegdate() {
			return regdate;
		}
		public void setRegdate(Timestamp regdate) {
			this.regdate = regdate;
		}
		
		
	

	}

	
	

