package com.project.proto;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.chat.EchoHandler;

import com.project.proto.command.login.Command;
import com.project.proto.dao.Dao;
import com.project.proto.dto.Dto;

@Controller
public class MainController {

	Command comm;
	
	@Autowired
	Dao dao;
	
	@Autowired
	EchoHandler echoHandler;
	
	
	//main로그인 성공시, homepage이동
	
	@RequestMapping("/main")
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
	}
	
	@RequestMapping("/news")
	public String news(Model mv,HttpSession session,HttpServletResponse response) {
		System.out.println("news페이지()실행");
		return "news";

	}
	@RequestMapping("/team")
	public String team(Model mv,HttpSession session,HttpServletResponse response) {
		System.out.println("team페이지()실행");
		return "team";

	}
	@RequestMapping("/messenser")
	public String messenser(Model mv,HttpSession session,HttpServletResponse response) {
		System.out.println("messenser페이지()실행");
		return "messenser";

	}
	@RequestMapping("/about")
	public String about(Model mv,HttpSession session,HttpServletResponse response) {
		System.out.println("about페이지()실행");
		return "about";

	}
	@RequestMapping("/settings")
	public String settings(Model mv,HttpSession session,HttpServletResponse response) {
		System.out.println("settings페이지()실행");
		return "settings";

	}
	
	
	/*로그아웃 구현 완료*/
	@RequestMapping("/logout")
	public void logout(Model mv,HttpSession session,HttpServletResponse response) {
		System.out.println("logout페이지()실행");
		session.invalidate();
	}
	
	@RequestMapping("/typeA")
	public String TypeA(Model model) {
		System.out.println("TypeA()실행");
		return "main/Type_A";

	}
	
	@RequestMapping("/typeB")
	public String TypeB(Model model) {
		System.out.println("TypeB()실행");
		return "main/Type_B";

	}
	
	
	
}
