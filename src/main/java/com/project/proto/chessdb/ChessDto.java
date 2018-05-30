package com.project.proto.chessdb;

import java.util.Date;

public class ChessDto {
	
	private String nickname;
	private String color; // 흑, 백.
	private String piece;
	private String beforeranks; // 가로줄.
	private String beforefiles; // 세로줄.
	private String afterranks;
	private String afterfiles;
	private String playdate; // 게임한 날짜.
	
	//nullable => no - null이 되는 걸 막는 의미.
	//데이터가 들어가있어야 insert, update, modify가 가능. 아니면 오류.
	
	public String getPiece() {
		return piece;
	}
	public void setPiece(String piece) {
		this.piece = piece;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getBeforefiles() {
		return beforefiles;
	}
	public void setBeforefiles(String beforefiles) {
		this.beforefiles = beforefiles;
	}
	
	public String getBeforeranks() {
		return beforeranks;
	}
	public void setBeforeranks(String beforeranks) {
		this.beforeranks = beforeranks;
	}
	
	public String getAfterfiles() {
		return afterfiles;
	}
	public void setAfterfiles(String afterfiles) {
		this.afterfiles = afterfiles;
	}
	
	public String getAfterranks() {
		return afterranks;
	}
	public void setAfterranks(String afterranks) {
		this.afterranks = afterranks;
	}
	
	public void setPlaydate(String playdate) {
		this.playdate = playdate;
	}
	public String getPlaydate() {
		return playdate;
	}
}