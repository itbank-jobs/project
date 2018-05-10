package com.project.proto.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.proto.dto.board1Dto;


@Repository
public class board1Dao {

	
	@Autowired
	private SqlSession sqlSession;
	
	//글 목록 불러오기
	public List<Object> list() {
		return sqlSession.selectList("List");
	}
	
	//글 내용 불러오기
	public board1Dto content(String num) {
		return (board1Dto) sqlSession.selectList("contentList");
	}
	
	//글쓰기
	public void write(board1Dto dto) {
	sqlSession.insert("write", dto);	
	
	}
	
	
}