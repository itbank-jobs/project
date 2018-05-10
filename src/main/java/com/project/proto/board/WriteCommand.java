package com.project.proto.board;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.project.proto.dao.board1Dao;





public class WriteCommand implements Command {

	@Override
	public void execute(Model model, board1Dao dao) {
		// TODO Auto-generated method stub
		
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		String name = request.getParameter("Name");
		String title = request.getParameter("Title");
		String content = request. getParameter("Content");
		
	
		dao.write(name, title, content); 
		
		try {
			response.sendRedirect("list");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
