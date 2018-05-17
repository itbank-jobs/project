package com.project.proto.command;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.proto.command.login.Command;
import com.project.proto.dao.Dao;
import com.project.proto.dto.Dto;

public class settingCommand implements Command {

	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		
		HttpSession session =(HttpSession) map.get("session");
		
	
		String employeeNumber = ""+session.getAttribute("employeeNumber");
	
		System.out.println(employeeNumber);
		Dto setting = dao.setting(employeeNumber);
		model.addAttribute("setting",setting);
	}

}
