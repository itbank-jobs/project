package com.project.proto.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.proto.dto.Notice_Dto;

@Repository
public class Notice_Dao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Notice_Dto> list(int currentPageNum) {
		System.out.println("list()호출");
		return sqlSession.selectList("noticeList", currentPageNum);
	}
	public List<Notice_Dto> list() {
		System.out.println("listAll()호출");
		return sqlSession.selectList("noticeStart");
	}
	


}
