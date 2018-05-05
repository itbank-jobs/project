package com.project.proto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.command.Command;
import com.project.proto.dao.Dao;

@Controller
public class MainController {

	Command comm;


	@Autowired
	Dao dao;
	
	
	//main로그인 성공시, homepage이동
	
	@RequestMapping("/main")
	public String main(Model model) {
		System.out.println("main페이지()실행");
		return "main";

	}
	
	
}
