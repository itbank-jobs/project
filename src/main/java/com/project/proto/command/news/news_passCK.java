package com.project.proto.command.news;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.ui.Model;

import com.project.proto.command.login.Command;
import com.project.proto.dao.Dao;

public class news_passCK implements Command {

	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub
	
		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");

		int reqPass = Integer.parseInt(req.getParameter("passwd"));
		
		int sqlval = dao.news_passCK(reqPass);
		
		try {
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			out.print(sqlval);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
