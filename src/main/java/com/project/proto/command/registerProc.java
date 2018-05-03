package com.project.proto.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.ui.Model;

import com.project.proto.dao.Dao;
import com.project.proto.dto.Dto;

public class registerProc implements Command {

	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int employeeNumber =  Integer.parseInt(req.getParameter("employeeNumber"));
		String name =  req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Dto dto = new Dto(employeeNumber,name,email,password);
	   

}
