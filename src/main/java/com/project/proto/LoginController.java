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
import com.project.proto.command.registerProc;
import com.project.proto.dao.Dao;
import com.project.proto.command.find_PW;;



@Controller
public class LoginController {

	Command comm;


	@Autowired
	Dao dao;
	
	//濡쒓렇�씤(main)
	@RequestMapping(value = "/")
	public String login(Model model, HttpSession session) {
		
	
		System.out.println("login()�떎�뻾");
		session.invalidate();

		return "login";


	}
	//濡쒓렇�씤 �븘�씠�뵒 鍮꾨�踰덊샇 泥댄겕
	@RequestMapping("/loginCheck")
	public void loginCheck(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse res) {
		System.out.println("loginCheck()�떎�뻾");
		
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		model.addAttribute("session", session);
		
		comm = new loginCheck();
		comm.execute(model, dao);
		
	}
	
	//�쉶�썝媛��엯, �쉶�썝�젙蹂� �엯�젰李�
	@RequestMapping("/register")
	public String register(Model model, HttpSession session) {
		
		System.out.println("register()�떎�뻾");
		return "register";
		
	}
	
	
	@RequestMapping("/emailCheck")
	public void emailCheck(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("emailCheck()�떎�뻾");
		
		try {
			PrintWriter out = res.getWriter();
			String email = (req.getParameter("email")==null) ? "" : req.getParameter("email");
			
			
			int chk = dao.emailList(email); //�씪移섑븯�뒗 媛믪씠 �뾾�쑝硫� sql�떎�뻾 寃곌낵 0
			
			out.print(chk); //=result
			out.flush();
			out.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}
	
	//�쉶�썝�젙蹂� �엯�젰媛� 諛쏄퀬 �씠�룞.
	@RequestMapping("/registerProc")
	public String registerProc(Model model, HttpServletRequest req) throws UnsupportedEncodingException {
		
		System.out.println("registerProc()�떎�뻾");
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req", req);
		
		comm = new registerProc();
		comm.execute(model, dao);
		
		return "login";
	}
	

	

	@RequestMapping("/find")
	public String find(Model model) {
		System.out.println("find()�떎�뻾");
		return "find";

	}

	@RequestMapping("/find_PW")
	public String find_PW(Model model , HttpServletRequest req, HttpServletResponse res) {
		System.out.println("find()�떎�뻾");
		
		
		model.addAttribute("req", req);
		model.addAttribute("res", res);
		comm = new find_PW();
		comm.execute(model, dao);
		
		
		return "login";

	}
	



}
