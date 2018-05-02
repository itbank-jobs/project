package com.project.proto.command;

import org.springframework.ui.Model;

import com.project.proto.dao.Dao;


//로그인
public class login implements Command {

	@Override
	public void execute(Model model,Dao dao) {
		// TODO Auto-generated method stub
		model.addAttribute("member",dao.selectMember());
	}

}
