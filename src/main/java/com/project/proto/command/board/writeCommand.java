package com.project.proto.command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		
		
		String writer = req.getParameter("Writer");
		String subject = req.getParameter("subject");
		String content = req.getParameter("Content");
		
		dto.setWriter(writer);
		dto.setSubject(subject);
		dto.setContent(content);
		
		dao.write(dto);

	}

}
