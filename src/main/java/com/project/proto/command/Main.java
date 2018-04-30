package com.project.proto.command;

import org.springframework.ui.Model;

import com.project.proto.dao.Dao;



public class Main implements Command {

	@Override
	public void execute(Model model,Dao dao) {
		// TODO Auto-generated method stub
		model.addAttribute("member",dao.selectMember());
	}

}
