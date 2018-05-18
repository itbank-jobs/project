package com.project.proto;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.proto.command.reply.Command;
import com.project.proto.command.reply.InsertReplyCommand;
import com.project.proto.command.reply.replyDeleteCommand;
import com.project.proto.dao.reply_Dao;

@RestController // 데이터(json)을 리턴
@Controller //뷰를 리턴
public class ReplyController {

	Command comm;
	
	@Autowired
	reply_Dao dao;
	
	@RequestMapping("/insertReply")
	public void insertReply(Model model, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		System.out.println("insertReply()실행");
		
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		model.addAttribute("session", session);
			
		comm = new InsertReplyCommand();
		comm.execute(model, dao);
	}
	
	
	@RequestMapping("/replyDelete")
	public void replyDelete(Model model, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		System.out.println("replyDelete()실행");
		
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		
		comm = new replyDeleteCommand();
		comm.execute(model, dao);
	}
}
