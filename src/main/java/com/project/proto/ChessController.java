package com.project.proto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.chessCommand.Command;
import com.project.proto.chessCommand.NotationViewCommand;
import com.project.proto.chessCommand.SaveNotationCommand;
import com.project.proto.chessdb.ChessDao;


@Controller
public class ChessController {

	Command comm;

	@Autowired
	private ChessDao cdao;

	@RequestMapping("/chess")
	public String chess(Model model, HttpSession session, 
			HttpServletRequest req) {
		System.out.println("ChessController : chess play page loading...");
		
		return "chessTest/chess";
	}
	
	@RequestMapping("/NotationList")
	public String SaveNotation(Model model, HttpSession session, 
			HttpServletRequest req) {
		System.out.println("ChessController : SaveNotation method processing...");
		System.out.println("ChessController : NotationList page loading...");
		model.addAttribute("req", req);
		comm = new SaveNotationCommand();
		comm.execute(model, cdao);
		
		return "chessTest/NotationList";
	}
	
	@RequestMapping("/NotationView")
	public String list(Model model, HttpSession session) {
		System.out.println("ChessController : list method processing...");
		System.out.println("ChessController : NotationView page loading...");
		model.addAttribute("session", session);
		comm = new NotationViewCommand();
		comm.execute(model, cdao);
		
		return "chessTest/NotationView";
	}
	
}
