package com.project.proto.command.reply;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
		HttpSession session = (HttpSession) map.get("session");
		reply_Dto dto = new reply_Dto();
		
		System.out.println("bno : "+req.getParameter("bno"));
		
		/*String replyer =  (String) session.getAttribute("employeeNumber");
		String replytext = req.getParameter("replytext");
		int bno = Integer.parseInt(req.getParameter("num"));
		
		System.out.println("replyer : "+ replyer);
		System.out.println("replytext : "+ replytext);
		System.out.println("bno : "+ bno);
		dto.setBno(bno);
		dto.setReplyer(replyer);
		dto.setReplytext(replytext);*/
		
		
		dao.create(dto);

	}

}
