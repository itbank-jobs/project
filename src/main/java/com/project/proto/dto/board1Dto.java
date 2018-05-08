package com.project.proto.dto;

import java.sql.Timestamp;

	public class board1Dto {
		int num;
		String name;
		String title;
		String content;
		Timestamp bdate; 
		int hit;
		int bgroup;
		int step;
		int indent;
		String id;
		
		public board1Dto() {
			
		}
		
		public board1Dto(int num, String name, String title, String content, Timestamp bdate, int hit, int bgroup, int step, int indent,String id) {
			this.num = num;
			this.name = name;
			this.title = title;
			this.content = content;
			this.bdate= bdate;
			this.hit = hit;
			this.bgroup = bgroup;
			this.step = step;
			this.indent = indent;
			this.id = id;
		}
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public Timestamp getBdate() {
			return bdate;
		}
		public void setBdate(Timestamp bdate) {
			this.bdate = bdate;
		}
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		public int getBgroup() {
			return bgroup;
		}
		public void setBgroup(int bgroup) {
			this.bgroup = bgroup;
		}
		public int getStep() {
			return step;
		}
		public void setStep(int step) {
			this.step = step;
		}
		public int getIndent() {
			return indent;
		}
		public void setIndent(int indent) {
			this.indent = indent;
		}


	}

	
	

