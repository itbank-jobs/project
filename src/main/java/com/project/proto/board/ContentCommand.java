package com.project.proto.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.proto.dao.Dao;
import com.project.proto.dao.board1Dao;
import com.project.proto.dto.board1Dto;



public class ContentCommand implements Command{



	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub
		
		
		Map<String, Object>map = model.asMap();//?
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String num = request.getParameter("num");

		
		board1Dao dao = new board1Dao();
		board1Dto dto = dao.content(num);

		
		model.addAttribute("content",dto); 

	}

}
