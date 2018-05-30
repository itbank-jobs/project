package com.project.proto.command.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.proto.dao.Reply_Dao;
import com.project.proto.dto.Reply_Dto;

public class InsertReplyCommand implements Command {

	@Override
	public void execute(Model model, Reply_Dao dao) {
		// TODO Auto-generated method stub
		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		HttpSession session = (HttpSession) map.get("session");
		Reply_Dto dto = new Reply_Dto();

		
		
		
		dto.setBnum(Integer.parseInt(req.getParameter("bnum")));
		dto.setEmployeeNumber((int)session.getAttribute("employeeNumber"));
		dto.setReplytext(req.getParameter("replytext"));
		dao.create(dto);
		
		
		try {
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			dto = dao.rnum(dto).get(0);
			out.print(dto.getName()+"%"+dto.getRnum()+"%"+dto.getRegdate());
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		

	}

}
