package com.project.proto.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.proto.dao.board1Dao;
import com.project.proto.dto.board1Dto;



public class ReplyViewCommand implements Command {

	@Override
	public void execute(Model model, board1Dao dao) {
		// TODO Auto-generated method stub
		
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String num = request.getParameter("num");
		
	
		board1Dto dto = dao.replyview(num);
		
		//dao.replyview(id)를 통해 해당 id의 데이터값들을 전부 가져온다.
		//가져온 데이터 값들은 dto객체형태이다.
		//이 값을 가지고 뷰로 보여준다.
		model.addAttribute("reply_view",dto);
		
	}


}
