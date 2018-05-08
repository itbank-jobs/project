package com.project.proto.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.proto.dao.board1Dao;



public class ReplyWriteCommand implements Command {

	@Override
	public void execute(Model model, board1Dao dao) {
		// TODO Auto-generated method stub
		
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String bgroup = request.getParameter("bgroup");
		String step = request.getParameter("step");
		String indent = request.getParameter("indent");
		
		
		dao.replywrite(num, name, title, content, bgroup, step, indent);



	}

}
