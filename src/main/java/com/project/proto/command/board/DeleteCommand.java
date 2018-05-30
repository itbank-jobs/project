package com.project.proto.command.board;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.project.proto.dao.Board_Dao;


public class DeleteCommand implements Command {

	@Override
	public void execute(Model model, Board_Dao dao) {
		// TODO Auto-generated method stub

		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		
		String num = req.getParameter("num");
		String teamNum = req.getParameter("teamNum");
		
		dao.delete(num);
		try {
			res.sendRedirect("list?teamNum="+teamNum);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
