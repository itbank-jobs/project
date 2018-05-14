package com.project.proto;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.command.board.Command;
import com.project.proto.command.board.ListCommand;
import com.project.proto.dao.board_Dao;

@Controller
public class testController {

Command comm;
	
	@Autowired
	board_Dao dao;
	
	@RequestMapping("/view")
	public String view(Model model) {
		System.out.println("view()실행");
		return "main/Type_A";

	}
	
	@RequestMapping("/test")
	public String test(Model model) {
		System.out.println("test()실행");
		return "main/Type_B";

	}
	
	@RequestMapping("/testlist")
	public String testlist(Model model, HttpSession session) {
		System.out.println("testlist()실행");
		
		model.addAttribute("session", session);
		
		comm = new ListCommand();
		comm.execute(model, dao);
		return "board/team";
		
	}
}
