package com.project.proto.command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


import com.project.proto.dao.board_Dao;
import com.project.proto.dto.board_Dto;

public class ContentCommand implements Command {

	@Override
	public void execute(Model model, board_Dao dao) {
		// TODO Auto-generated method stub
		
		Map<String, Object>map = model.asMap();//?
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		
		board_Dto dto = dao.content(Integer.parseInt(req.getParameter("num"))).get(0);

		model.addAttribute("content",dto); 

	}

}
