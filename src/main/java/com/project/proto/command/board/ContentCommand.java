package com.project.proto.command.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.ui.Model;


import com.project.proto.dao.board_Dao;
import com.project.proto.dto.board_Dto;

import com.project.proto.dto.reply_Dto;

public class ContentCommand implements Command {
	
	@Override
	public void execute(Model model, board_Dao dao) {
		// TODO Auto-generated method stub

		board_Dto bdto;
	
		Map<String, Object>map = model.asMap();//?

		HttpServletRequest req = (HttpServletRequest) map.get("req");
		//조회수
		dao.readcount(req.getParameter("num"));
		//게시판 content
		bdto = dao.content(Integer.parseInt(req.getParameter("num"))).get(0);
		//댓글 contentList
		List<reply_Dto>replylist = dao.contentReply(req.getParameter("num"));
	

		model.addAttribute("content",bdto); 
		model.addAttribute("reply", replylist);//member table's name, reply table

	}

}
