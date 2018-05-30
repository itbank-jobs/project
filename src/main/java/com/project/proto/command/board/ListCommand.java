package com.project.proto.command.board;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


import com.project.proto.dao.Board_Dao;
import com.project.proto.dto.Board_Dto;




public class ListCommand implements Command {

	@Override
	public void execute(Model model, Board_Dao dao) {
		
		
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String teamNum = req.getParameter("teamNum");	
		String pageNum = req.getParameter("num");
	
		
		
		if (pageNum == null) {
			pageNum = "1";
		}

		int pageSize = 15;
		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		count = dao.count(teamNum);
		List<Board_Dto> list = null;
		if (count > 0) {

			list = dao.list(startRow, endRow , teamNum);
	
			
		} else {
			list = Collections.emptyList();
		}

		number = count - (currentPage - 1) * pageSize;

		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("teamNum", teamNum);
		
		

		model.addAttribute("list", list);

		
		
		

		
	
	}

}
