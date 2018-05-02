package com.project.proto;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.project.proto.command.Command;
import com.project.proto.command.login;
import com.project.proto.command.registerProc;
import com.project.proto.dao.Dao;



@Controller
public class MainController {

	Command comm;


	@Autowired
	Dao dao;
	
	//로그인(main)
	@RequestMapping(value = "/")
	public String main(Model model) {
		
		/*comm = new login();
		comm.execute(model,dao);*/
	
		return "login";
	}
	
	//회원가입, 회원정보 입력창
	@RequestMapping("/register")
	public String register(Model model) {
		
		System.out.println("register()실행");
		return "register";
		
	}
	
	//회원정보 입력값 받고 이동.
	@RequestMapping("/registerProc")
	public String registerProc(Model model, HttpServletRequest req) {
		
		System.out.println("registerProc()실행");
		
		model.addAttribute("req", req);
		
		comm = new registerProc();
		comm.execute(model, dao);
		
		return "registerProc";
	}
	
	//main로그인 성공시, homepage이동
	@RequestMapping("/home")
	public String homepage(Model model) {
		System.out.println("homepage()실행");
		return "homepage";
	}


}
