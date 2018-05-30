package com.project.proto;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.command.board.Command;
import com.project.proto.command.board.ListCommand;
import com.project.proto.dao.Dao;
import com.project.proto.dto.ChessDto;
import com.project.proto.dto.board_Dto;

@Controller
public class ChessTestController {
	
	
	@Autowired
	Dao dao;
	
	Command comm;
	
	@RequestMapping(value = "/chessTest")
	public String chess(Model model) {

		return "chessTest/chessTest4";
	}
	
	@RequestMapping(value = "/chessReviewResult")
	public String chessReviewResult(Model model,HttpSession session) {
		String tmp = ""+ session.getAttribute("employeeNumber");
		model.addAttribute("chessReplayList",dao.chessSelect(tmp));
		return "chessTest/chessReviewResult";
	}
	@RequestMapping(value = "/chessContent_view")
	public String chessContent_view(Model model) {
		return "chessTest/chessContent_view";
	}
	
	@RequestMapping(value = "/chessWrite")
	public String chessWrite(Model model,HttpServletRequest request,HttpSession session) {
		board_Dto dto = new board_Dto();
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int teamNum = 5;
		String pass = request.getParameter("pass");
		int employeeNumber = (int) session.getAttribute("employeeNumber");
		dto.setSubject(subject);
		
		dto.setContent(content);
		dto.setTeamNum(teamNum);
		dto.setPass(pass);
		dto.setEmployeeNumber(employeeNumber);
		
		dao.write(dto);
		return "chessTest/chessReview";
	}

	
	
	@RequestMapping(value = "/chessInsert")
	public void chessInsert(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		ChessDto dto = new ChessDto();
		dto.setPlayer1(request.getParameter("player1"));
		dto.setPlayer2(request.getParameter("player2"));
		dao.chessInsert(dto);
		PrintWriter out = response.getWriter();
		out.print(dao.chessNum(request.getParameter("player1")).get(0));
		out.flush();
		out.close();
	}
	
	
	@RequestMapping(value = "/chessUpdate")
	public void chessUpdate(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		ChessDto dto = new ChessDto();
		dto.setNotation(request.getParameter("notation"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		System.out.println(dto.getNum());
		dao.chessUpdate(dto);
		PrintWriter out = response.getWriter();
		out.println(0);
		out.flush();
		out.close();
	}
	
	
}
