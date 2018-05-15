package com.project.proto.dto;

import java.sql.Timestamp;

	public class board_Dto {
		int num;
		int employeeNumber;
		int teamNum;
		String name;
		String subject;
		String content;
		String pass;
		int readcount;
		Timestamp regdate;
	

		public int getTeamNum() {
			return teamNum;
		}
		public void setTeamNum(int teamNum) {
			this.teamNum = teamNum;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		
		public int getEmployeeNumber() {
			return employeeNumber;
		}
		public void setEmployeeNumber(int employeeNumber) {
			this.employeeNumber = employeeNumber;
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

	
	

