package com.project.proto.command.board;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.project.proto.dao.board_Dao;
import com.project.proto.dto.board_Dto;

public class DeleteCommand implements Command {

	@Override
	public void execute(Model model, board_Dao dao) {
		// TODO Auto-generated method stub
		board_Dto dto = new board_Dto();
		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		
		String num = req.getParameter("num");
		String teamNum = req.getParameter("teamNum");
		System.out.println("delTeamNum: "+teamNum);
		dao.delete(num);
		try {
			res.sendRedirect("list?teamNum="+teamNum);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
