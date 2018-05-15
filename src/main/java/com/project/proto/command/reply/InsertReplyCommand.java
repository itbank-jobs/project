package com.project.proto.command.reply;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.proto.dao.reply_Dao;
import com.project.proto.dto.reply_Dto;

public class InsertReplyCommand implements Command {

	@Override
	public void execute(Model model, reply_Dao dao) {
		// TODO Auto-generated method stub
		Map<String, Object>map = model.asMap();//?
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse rep = (HttpServletResponse) map.get("rep");
		HttpSession session = (HttpSession) map.get("session");
		reply_Dto dto = new reply_Dto();
		System.out.println("replytext : "+req.getParameter("replytext"));
		System.out.println("comman session : " + session.getAttribute("employeeNumber"));
		System.out.println("bnum : "+Integer.parseInt(req.getParameter("bnum")));

	
	
		
		dto.setBnum(Integer.parseInt(req.getParameter("bnum")));
		dto.setEmployeeNumber((int)session.getAttribute("employeeNumber"));
		dto.setReplytext(req.getParameter("replytext"));
		
		
		dao.create(dto);

	}

}
