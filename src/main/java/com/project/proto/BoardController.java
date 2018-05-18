package com.project.proto;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.command.board.Command;
import com.project.proto.command.board.ContentCommand;
import com.project.proto.command.board.DeleteCommand;
import com.project.proto.command.board.ListCommand;
import com.project.proto.command.board.ModifyCommand;
import com.project.proto.command.board.writeCommand;
import com.project.proto.dao.board_Dao;

@Controller
public class BoardController {
	//보드 컨트롤러
	Command comm;
	
	@Autowired
	board_Dao dao;
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest req, HttpSession session,HttpServletResponse res) {
		System.out.println("list()실행");
		
		model.addAttribute("session", session);
		model.addAttribute("req",req);
		comm = new ListCommand();
		comm.execute(model, dao);
		return "board/team";
		
	}

	
	@RequestMapping("/write")
	public void write(Model model, HttpServletRequest req, HttpSession session,HttpServletResponse res) throws UnsupportedEncodingException {
		System.out.println("write()실행");
	
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		model.addAttribute("session", session);
		
		comm = new writeCommand();
		comm.execute(model, dao);
		
	
	}
	
	@RequestMapping("/content")
	public String content(Model model, HttpServletRequest req, HttpSession session,HttpServletResponse res) {
		System.out.println("content_view()실행");
		
		model.addAttribute("req",req);

		comm = new ContentCommand();
		comm.execute(model, dao);
	
		return "/board/content";
	}
	


	@RequestMapping("/modify_complete")
	public void modify_complete(Model model, HttpServletRequest req, HttpSession session,HttpServletResponse res) throws UnsupportedEncodingException {
		System.out.println("modify_complete()실행");
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		
		comm = new ModifyCommand();
		comm.execute(model, dao);
		
	
	}
	
	@RequestMapping("/delete")
	public void delete(Model model, HttpServletRequest req, HttpSession session,HttpServletResponse res) {
		System.out.println("delete()실행");
		
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		
		comm = new DeleteCommand();
		comm.execute(model, dao);
	}
	


	
	@RequestMapping("/write_view")
	public String write_view(Model model, HttpServletRequest req, HttpSession session,HttpServletResponse res) throws UnsupportedEncodingException {
		System.out.println("write_view()실행");
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("teamNum",req.getParameter("teamNum"));
		return "board/write_view";
	}
	
	@RequestMapping("/content_view")
	public String content_view(Model model, HttpServletRequest req, HttpSession session,HttpServletResponse res) {
		System.out.println("content_view()실행");
		
		model.addAttribute("req",req);

		comm = new ContentCommand();
		comm.execute(model, dao);
		
		return "board/content_view";
	}
	
	@RequestMapping("/modify_view")
	public String modify_view(Model model, HttpServletRequest req, HttpSession session,HttpServletResponse res) {
		System.out.println("modify_view()실행");
		
		model.addAttribute("req", req);
		
		comm = new ContentCommand();
		comm.execute(model, dao);
		
		return "board/modify_view";

	}
	
}
