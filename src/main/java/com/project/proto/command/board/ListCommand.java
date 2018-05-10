package com.project.proto.command.board;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.project.proto.dao.board_Dao;
import com.project.proto.dto.board_Dto;




public class ListCommand implements Command {

	@Override
	public void execute(Model model, board_Dao dao) {
		
		
		
		List<board_Dto> list = dao.list();
		
		model.addAttribute("list", list);
		
	
	}

}
