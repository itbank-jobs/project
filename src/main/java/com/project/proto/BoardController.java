package com.project.proto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.command.board.Command;
import com.project.proto.command.board.ListCommand;
import com.project.proto.command.board.writeCommand;
import com.project.proto.dao.board_Dao;

@Controller
public class BoardController {
	
	Command comm;
	
	@Autowired
	board_Dao dao;
	
	@RequestMapping("/list")
	public String list(Model model, HttpSession session) {
		System.out.println("list()실행");
		
		model.addAttribute("session", session);
		
		comm = new ListCommand();
		comm.execute(model, dao);
		return "board/list";
		
	}
	
	@RequestMapping("/write_view")
	public String write_view(Model model, HttpSession session) {
		System.out.println("write_view()실행");
		
		return "board/write_view";
	}
	
	@RequestMapping("/write")
	public String write(Model model, HttpSession session, HttpServletRequest req) {
		System.out.println("write()실행");
		
		model.addAttribute("req", req);
		comm = new writeCommand();
		comm.execute(model, dao);
		
		return "board/list";
	}

}
