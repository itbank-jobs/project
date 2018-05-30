package com.project.proto.dao;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.proto.dto.Board_Dto;
import com.project.proto.dto.Reply_Dto;


@Repository
public class board_Dao {

	
	@Autowired
	private SqlSession sqlSession;
	
	//글 목록 불러오기

	public List<Board_Dto> list(int startRow, int endRow, String teamNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", startRow);
		map.put("end", endRow);
		map.put("teamNum", teamNum);
		
		return sqlSession.selectList("List",map);
	}
	
	
	
	
	//글 내용 불러오기
	public List<Board_Dto> content(int num) {
		return  sqlSession.selectList("content",num);
	}
	
	//글쓰기
	public void write(Board_Dto dto) {
	sqlSession.insert("write", dto);	
	}
	
	//글수정
	public void modify(Board_Dto dto) {
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

	public int count(String teamNum) {
		// TODO Auto-generated method stub
		int count = 0;

		try {
			count = sqlSession.selectOne("countteamNum", teamNum);
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return count;
		}
	
	}
	
	public List<Reply_Dto> contentReply(String num) {
		return sqlSession.selectList("contentReply", num);
	}
	
	
}