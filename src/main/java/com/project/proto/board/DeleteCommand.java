package com.project.proto.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


import com.project.proto.dao.board1Dao;


public class DeleteCommand implements Command {

	@Override
	public void execute(Model model, board1Dao dao) {
		// TODO Auto-generated method stub
		
		Map<String , Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String num = request.getParameter("num"); 
	
		dao.delete(num);
	

	}

}
