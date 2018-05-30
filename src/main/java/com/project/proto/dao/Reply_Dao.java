package com.project.proto.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.proto.dto.Reply_Dto;

@Repository
public class Reply_Dao {

	@Autowired
	private SqlSession sqlSession;
	
	//댓글 목록
	public List<Reply_Dto> list(){
		return null;
	}
	//댓글 작성
	public void create(Reply_Dto dto) {
		sqlSession.insert("insertReply", dto); 
		
	}
	//댓글 수정
	public void update(Reply_Dto dto) {
	}
	//댓글 삭제
	public void delete(Reply_Dto dto) {
	}
	public void replyDelete(String rnum) {
		sqlSession.delete("replyDelete", rnum);
		
	}
	//댓글 입력시 바로 삭제를 위한, rnum들고오기
	public List<Reply_Dto> rnum(Reply_Dto dto) {
		return sqlSession.selectList("rnum", dto);
		
		
	}
	
	
	
	//페이지 넘으로 들어간 페이지에서 그에 맞는 댓글 목록 불러오기
	
	
	
}
