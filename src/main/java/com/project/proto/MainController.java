package com.project.proto;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.project.proto.command.Command;
import com.project.proto.command.Main;
import com.project.proto.dao.Dao;



@Controller
public class MainController {

	Command comm;


	@Autowired
	Dao dao;
	
	
	@RequestMapping(value = "/")
	public String main(Model model) {
		
		comm = new Main();
		comm.execute(model,dao);
	
		return "login";
	}



}
