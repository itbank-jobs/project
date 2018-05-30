package com.project.proto.controller;




import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.chat.EchoHandler;

import com.project.proto.command.InfoCommand;
import com.project.proto.command.SettingCommand;

import com.project.proto.command.login.Command;

import com.project.proto.dao.Dao;
import com.project.proto.dao.Notice_Dao;
import com.project.proto.dto.ChatComment_Dto;
import com.project.proto.dto.Chat_Dto;
import com.project.proto.dto.Dto;


import oracle.net.aso.d;



@Controller
public class MainController {

	Command comm;
	
	@Autowired
	Dao dao;
	
	@Autowired
	Notice_Dao ndao;
	
	@Autowired
	EchoHandler echoHandler;
	
	//main로그인 성공시, homepage이동
	
/*	@RequestMapping("/main")
	public String main(Model mv,HttpSession session,HttpServletResponse response) {
		System.out.println("main페이지()실행");
		mv.addAttribute("chatList", dao.chatList());
		List<Dto> list = new ArrayList<Dto>();
		List<String> liveList = new ArrayList<String>();
		for(int i = 0; i<echoHandler.getList().size(); i ++) {
			Dto dto = new Dto();
			dto.setName((String)echoHandler.getList().get(i).getAttributes().get("name"));
			dto.setEmployeeNumber(Integer.parseInt((String)echoHandler.getList().get(i).getAttributes().get("employeeNumber")));
			liveList.add((String)echoHandler.getList().get(i).getAttributes().get("employeeNumber"));
			list.add(dto);				
		}
		
		mv.addAttribute("chatListLive",list);
		mv.addAttribute("liveList",liveList);
		System.out.println(echoHandler.getList().size()!=0?echoHandler.getList().get(0).getAttributes().get("echoHandler"):null);
		return "main/Type_B";
	}*/
	
	@RequestMapping("/news")
	public String news(Model model, HttpSession session,HttpServletRequest req,HttpServletResponse res){
		System.out.println("news페이지()실행");	
		model.addAttribute("noticeList", ndao.list());
		return "news/news";
	}

	
	@RequestMapping("/team")
	public String team(Model model, HttpSession session,HttpServletRequest req,HttpServletResponse res) {
		System.out.println("team페이지()실행");
		
		return "team";

	}
	@RequestMapping("/messenser")
	public String messenser(Model model, HttpSession session,HttpServletRequest req,HttpServletResponse res) {
		System.out.println("messenser페이지()실행");
		return "messenser";

	}
	@RequestMapping("/about")
	public String about(Model model, HttpSession session,HttpServletRequest req,HttpServletResponse res) {
		System.out.println("about페이지()실행");
		return "about";

	}
	
	
	/*로그아웃 구현 완료*/
	@RequestMapping("/logout")
	public void logout(Model model, HttpSession session,HttpServletRequest req,HttpServletResponse res) {
		System.out.println("logout페이지()실행");
		session.invalidate();
		try {
			res.sendRedirect("/proto");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	

	
	@RequestMapping("/typeB")
	public String TypeB(Model model, HttpSession session,HttpServletRequest req,HttpServletResponse res) {
		System.out.println("TypeB()실행");
		System.out.println("main페이지()실행");
		
		return "main/Type_B";

	}
	
	@RequestMapping("/settings")
	public String setting(Model model, HttpSession session,HttpServletRequest req,HttpServletResponse res) {
		System.out.println("setting()실행");
		
		model.addAttribute("session",session);
		
		comm = new SettingCommand();
		comm.execute(model, dao);
		
		
		return "setting";

	}
	
	
	@RequestMapping("/info_modify")
	public void info_modify(Model model, HttpSession session,HttpServletRequest req,HttpServletResponse res) throws UnsupportedEncodingException {
		System.out.println("info_modify()실행");
		
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		
		comm = new InfoCommand();
		comm.execute(model, dao);
	}


}
