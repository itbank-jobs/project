package com.project.proto.dto;


	
	public class Dto{
		
		private int employeeNumber;
		private int teamNum;
		private String name;
		private String email;
		private String password;
		private String day;

		
		
		public Dto() {
			
		}
		
		public Dto(int employeeNumber ,String name ,String email,String password) {
			this.employeeNumber = employeeNumber;
			this.name = name;
			this.email = email;
			this.password = password;

		}
		
		
		public int getTeamNum() {
			return teamNum;
		}

		public void setTeamNum(int teamNum) {
			this.teamNum = teamNum;
		}

		public int getEmployeeNumber() {
			return employeeNumber;
		}
		public void setEmployeeNumber(int employeeNumber) {
			this.employeeNumber = employeeNumber;
		}
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}

		public String getDay() {
			return day;
		}

		public void setDay(String day) {
			this.day = day;
		}
		
		
		
		
	}

	
	
