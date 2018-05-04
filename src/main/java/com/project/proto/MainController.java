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

import com.project.proto.command.Command;

import com.project.proto.command.loginCheck;
import com.project.proto.command.loginSessionCheck;
import com.project.proto.command.registerProc;
import com.project.proto.dao.Dao;
import com.project.proto.command.find_PW;;



@Controller
public class MainController {

	Command comm;


	@Autowired
	Dao dao;
	
	//로그인(main)
	@RequestMapping(value = "/")
	public String main(Model model, HttpSession session) {
		
		/*session.setAttribute("employeeNumber", null);
		session.setAttribute("password", null);*/
	
		session.invalidate();
	
		return "login";


	}
	//로그인 아이디 비밀번호 체크
	@RequestMapping("/loginCheck")
	public void main(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse res) {
		System.out.println("loginCheck()실행");
		
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		model.addAttribute("session", session);
	
		comm = new loginCheck();
		comm.execute(model, dao);
		
	}
	
	//회원가입, 회원정보 입력창
	@RequestMapping("/register")
	public String register(Model model) {
		
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
	
	//main로그인 성공시, homepage이동
	
	@RequestMapping("/main")
	public String homepage(Model model) {
		System.out.println("main()실행");
		return "main";

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
