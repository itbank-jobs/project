package com.project.proto.dao;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.proto.dto.ChatComment_Dto;
import com.project.proto.dto.Dto;
import com.project.proto.dto.notice_Dto;



@Repository
public class Dao {
	
	

	@Autowired
	private SqlSession sqlSession;
	

	public List<ChatComment_Dto> selectChatList(ChatComment_Dto dto){
		
		return sqlSession.selectList("selectChatList",dto);
	}
	
	public void insertChatList(ChatComment_Dto dto){
		sqlSession.insert("insertChatList",dto);
	}
	
	public List<Dao> selectMember() {
		return sqlSession.selectList("selectList");
	}
	

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


		public int news_passCK(int reqPass) {
			int sql = 1 ;
			try {
				int sqlPass = sqlSession.selectOne("news_passCK",reqPass);
				if(sqlPass == reqPass){
					sql = 1;
				};
				
			} catch (Exception e) {
				sql = 0;
			}
		 
		 return sql;
		}
	
	//공지사항 쓰기
	public void insertNews(notice_Dto dto) {
			sqlSession.insert("insertNews",dto);
	}
}
