package com.project.proto.dto;

import java.util.List;

public class Chat_Dto{
		
		private int employeeNumber;
		private String name;
		private String style;
		private List<ChatComment_Dto> commentList; 
	
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
		public String getStyle() {
			return style;
		}
		public void setStyle(String style) {
			this.style = style;
		}
		
		public List<ChatComment_Dto> getCommentList() {
			return commentList;
		}
		public void setCommentList(List<ChatComment_Dto> commentList) {
			this.commentList = commentList;
		}
	
		
		
	}

	
	
