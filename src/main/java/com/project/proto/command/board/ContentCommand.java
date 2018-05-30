package com.project.proto.command.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.ui.Model;


import com.project.proto.dao.Board_Dao;
import com.project.proto.dto.Board_Dto;

import com.project.proto.dto.Reply_Dto;

public class ContentCommand implements Command {
	
	@Override
	public void execute(Model model, Board_Dao dao) {
		// TODO Auto-generated method stub

		Board_Dto bdto;
	
		Map<String, Object>map = model.asMap();//?

		HttpServletRequest req = (HttpServletRequest) map.get("req");
		//조회수
		dao.readcount(req.getParameter("num"));
		//게시판 content
		bdto = dao.content(Integer.parseInt(req.getParameter("num"))).get(0);
		//댓글 contentList
		List<Reply_Dto>replylist = dao.contentReply(req.getParameter("num"));
	

		model.addAttribute("content",bdto); 
		model.addAttribute("reply", replylist);//member table's name, reply table

	}

}
