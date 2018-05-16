package com.project.proto.command.reply;


import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.project.proto.dao.reply_Dao;

public class replyDeleteCommand implements Command {

	@Override
	public void execute(Model model, reply_Dao dao) {
		// TODO Auto-generated method stub
		
		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		
		String rnum = req.getParameter("rnum");
		String bnum = req.getParameter("bnum");
		System.out.println("rnum : "+rnum);
		System.out.println("bnum : "+bnum);
		
		dao.replyDelete(rnum);
		//rnum의 레코드의 사원번호를 가져와서 삭제버튼을 누르는 작성자와 사원번호 비교후, 일치하면 삭제하기
		
		//reply.js파일에서 reload하면 아래의 sendRedirect랑 겹치나? reload된 후, sendRedirect되는 건가?
		try {
			res.sendRedirect("content?num="+bnum);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} 

}
