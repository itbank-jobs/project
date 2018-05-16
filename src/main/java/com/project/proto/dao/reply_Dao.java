package com.project.proto.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.proto.dto.reply_Dto;

@Repository
public class reply_Dao {

	@Autowired
	private SqlSession sqlSession;
	
	//댓글 목록
	public List<reply_Dto> list(){
		return null;
	}
	
	//댓글 갯수
	public int count(int bno) {
		return (Integer) null;
	}
	//댓글 작성
	public void create(reply_Dto dto) {
		sqlSession.insert("insertReply", dto); 
		System.out.println("여기까지 옴!");
	}
	//댓글 수정
	public void update(reply_Dto dto) {
	}
	//댓글 삭제
	public void delete(reply_Dto dto) {
	}
	
	public reply_Dto detail(int rno) {
		return null;
	}
	
	
}
