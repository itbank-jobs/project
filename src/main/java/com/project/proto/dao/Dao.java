package com.project.proto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.activation.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.proto.dto.Dto;



@Repository
public class Dao {
	
	

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<Dao> selectMember() {
		return sqlSession.selectList("selectList");
	}
	
//emailCheck
	public int emailList(String email){ //boolean으로 반환하는거 물어보기
		return sqlSession.selectList("emailList",email).size();
		//일치하는 값이 없으면 0반환?
		
	}

	public List<Dto> loginCheck(Dto dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("loginCheckList", dto);
	
	};
	
//회원가입
	public void register(Dto dto) {
		sqlSession.insert("register", dto);
	}

	public List<Dto> chatList(){
		return sqlSession.selectList("selectList");
	}
//비밀번호 찾기
	public Dto find_PW(int employeeNumber) {
		Dto dto;
		try{
			dto = (Dto)sqlSession.selectList("find_PW",employeeNumber).get(0);
						
		}catch (Exception e) {
			dto = null;
		}
		

	return dto;
		
	}
	
	//사원 정보 가져오기
		public Dto setting(String dto) {
			return sqlSession.selectOne("info",dto);
		}
	//사원 정보 수정하기
		public void info(Dto dto) {
			sqlSession.update("info_modify",dto);
			
		}
	
}
