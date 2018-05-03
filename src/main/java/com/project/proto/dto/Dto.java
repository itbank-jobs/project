package com.project.proto.dto;


	
	public class Dto{
		
		private int employeeNumber;
		private String name;
		private String email;
		private String password;
		
		public Dto() {
			
		}
		
		public Dto(int employeeNumber ,String name ,String email,String password) {
			
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
		
		
		
		
	}

	
	
