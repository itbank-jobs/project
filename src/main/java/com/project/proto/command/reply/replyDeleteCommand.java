package com.project.proto.command.reply;


import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.project.proto.dao.reply_Dao;

public class replyDeleteCommand implements Command {

	@Override
	public void execute(Model model, reply_Dao dao) {
		// TODO Auto-generated method stub
		
		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		
		String rnum = req.getParameter("rnum");
		String bnum = req.getParameter("bnum");

		
		dao.replyDelete(rnum);

		try {
			res.sendRedirect("content?num="+bnum);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} 

}
