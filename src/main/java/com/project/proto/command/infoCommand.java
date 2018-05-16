package com.project.proto.command;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.project.proto.command.login.Command;
import com.project.proto.dao.Dao;
import com.project.proto.dto.Dto;

public class infoCommand implements Command {

	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		int employeeNumber = Integer.parseInt(req.getParameter("employeeNumber"));
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		
		System.out.println(name+"//"+password+"//"+email);
		
		Dto dto = new Dto();
		
		dto.setEmployeeNumber(employeeNumber);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPassword(password);
		
		dao.info(dto);
		
		try {
			res.sendRedirect("typeB");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
