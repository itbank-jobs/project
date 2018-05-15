package com.project.proto.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.proto.dto.board_Dto;
import com.project.proto.dto.reply_Dto;


@Repository
public class board_Dao {

	
	@Autowired
	private SqlSession sqlSession;
	
	//글 목록 불러오기

	public List<board_Dto> list() {
		return sqlSession.selectList("List");
	}
	
	//글 내용 불러오기
	public List<board_Dto> content(int num) {
		return  sqlSession.selectList("content",num);
	}
	
	//글쓰기
	public void write(board_Dto dto) {
	sqlSession.insert("write", dto);	
	}
	
	//글수정
	public void modify(board_Dto dto) {
		sqlSession.update("modify", dto); 
	}
	//글삭제
	public void delete(String num) {
		sqlSession.delete("delete", num);
		
	}
	//조회수
	public void readcount(String num) {
		sqlSession.update("readcount", num);
	}
	
	public List<reply_Dto> contentReply(String num) {
		System.out.println("여기까지 오나??");
		return sqlSession.selectList("contentReply", num);
	}
	
	
}