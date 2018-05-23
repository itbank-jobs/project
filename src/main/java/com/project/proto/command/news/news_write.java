package com.project.proto.command.news;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.project.proto.command.login.Command;
import com.project.proto.dao.Dao;
import com.project.proto.dao.notice_Dao;
import com.project.proto.dto.notice_Dto;

public class news_write implements Command {
	
	
	
	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub

		 Map<String, Object> map = model.asMap();
		 HttpServletRequest req = (HttpServletRequest) map.get("req");
		 HttpServletResponse res = (HttpServletResponse) map.get("res");
		 
		String author = req.getParameter("author");
		String title= req.getParameter("title");
		String content= req.getParameter("content");

		
		notice_Dto dto = new notice_Dto();
		
		dto.setAuthor(author);
		dto.setTitle(title);
		dto.setContent(content);
		
		
		
		dao.insertNews(dto);
		
		try {
			res.sendRedirect("news");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	


}
