package com.project.proto.command.board;

import java.io.IOException;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.proto.dao.board_Dao;
import com.project.proto.dto.board_Dto;

public class writeCommand implements Command {

	@Override
	public void execute(Model model, board_Dao dao) {
		// TODO Auto-generated method stub
		board_Dto dto = new board_Dto();
		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		HttpSession session = (HttpSession) map.get("session");
		
		int employeeNumber = (int) session.getAttribute("employeeNumber");
		res.setCharacterEncoding("UTF-8");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		int teamNum = Integer.parseInt(req.getParameter("teamNum"));
		String pass = req.getParameter("pass");


		dto.setSubject(subject);
		
		dto.setContent(content);
		dto.setTeamNum(teamNum);
		dto.setPass(pass);
		dto.setEmployeeNumber(employeeNumber);
		
		dao.write(dto);
		
		try {
			res.sendRedirect("list?teamNum="+teamNum);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}
