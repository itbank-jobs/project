package com.project.proto.chessdb;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.proto.dto.board_Dto;

@Repository
//Repository : dao라는 걸 알려주는 어노테이션.
public class ChessDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void saveNotation(ChessDto cdto) {
		sqlSession.insert("SaveNotation", cdto);
		System.out.println("ChessDao : saveNotation method processing...");
	}
	
/*	public ChessDto selectNotation(String num) {
		System.out.println("ChessDao : selectNotation process complete.");
		return (ChessDto) sqlSession.selectList("NotationView");
	}*/

	public List<ChessDto> NotationView() {
		System.out.println("ChessDao : NotationView method processing...");
		return sqlSession.selectList("NotationView");
	}
}