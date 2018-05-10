package com.project.proto.board;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.project.proto.dao.board1Dao;
import com.project.proto.dto.board1Dto;




public class ListCommand implements Command {

	@Override
	public void execute(Model model, board1Dao dao) {
		// TODO Auto-generated method stub
		int i = 0;
	
		ArrayList<board1Dto> resultdto = dao.list(); 
		
		//갯수
				
		model.addAttribute("Blist",resultdto); 
		model.addAttribute("number", resultdto.size() ); //데이터 리스트의 갯수
		
		
	}

}
