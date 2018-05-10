package com.project.proto;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.command.board.Command;
import com.project.proto.command.board.ListCommand;
import com.project.proto.dao.board1Dao;

@Controller
public class BoardController {
	
	Command comm;
	
	@Autowired
	board1Dao dao;
	
	@RequestMapping("/list")
	public String list(Model model, HttpSession session) {
		System.out.println("list()실행");
		
		comm = new ListCommand();
		comm.execute(model, dao);
		return "board1/list";
		
	}

}
