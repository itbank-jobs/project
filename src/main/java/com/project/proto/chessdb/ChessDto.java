package com.project.proto.chessdb;

public class ChessDto {
	
	private String nickname;
	private String notation;
	private String playdate; // 게임한 날짜.
	
	//nullable => no - null이 되는 걸 막는 의미.
	//데이터가 들어가있어야 insert, update, modify가 가능. 아니면 오류.
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getNotation() {
		return notation;
	}
	public void setNotation(String notation) {
		this.notation = notation;
	}
	
	public void setPlaydate(String playdate) {
		this.playdate = playdate;
	}
	public String getPlaydate() {
		return playdate;
	}
}