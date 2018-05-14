package com.project.proto;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.command.login.Command;
import com.project.proto.command.login.find_PW;
import com.project.proto.command.login.loginCheck;
import com.project.proto.command.login.registerProc;
import com.project.proto.dao.Dao;;



@Controller
public class LoginController {

	Command comm;


	@Autowired
	Dao dao;
	
	//로그인(main)
	@RequestMapping(value = "/")
	public String login(Model model, HttpSession session) {
		
	
		System.out.println("login()실행");

		return "login";


	}
	//로그인 아이디 비밀번호 체크
	@RequestMapping("/loginCheck")
	public void loginCheck(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse res) {
		System.out.println("loginCheck()실행");
		
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		model.addAttribute("session", session);
		
		comm = new loginCheck();
		comm.execute(model, dao);
		
	}
	
	//회원가입, 회원정보 입력창
	@RequestMapping("/register")
	public String register(Model model, HttpSession session) {
		
		System.out.println("register()실행");
		return "register";
		
	}
	
	
	@RequestMapping("/emailCheck")
	public void emailCheck(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("emailCheck()실행");
		
		try {
			PrintWriter out = res.getWriter();
			String email = (req.getParameter("email")==null) ? "" : req.getParameter("email");
			
			
			int chk = dao.emailList(email); //일치하는 값이 없으면 sql실행 결과 0
			
			out.print(chk); //=result
			out.flush();
			out.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}
	
	//회원정보 입력값 받고 이동.
	@RequestMapping("/registerProc")
	public String registerProc(Model model, HttpServletRequest req) throws UnsupportedEncodingException {
		
		System.out.println("registerProc()실행");
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req", req);
		
		comm = new registerProc();
		comm.execute(model, dao);
		
		return "login";
	}
	

	

	@RequestMapping("/find")
	public String find(Model model) {
		System.out.println("find()실행");
		return "find";

	}

	@RequestMapping("/find_PW")
	public String find_PW(Model model , HttpServletRequest req, HttpServletResponse res) {
		System.out.println("find()실행");
		
		
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		comm = new find_PW();
		comm.execute(model, dao);
		
		
		return "login";

	}


}
