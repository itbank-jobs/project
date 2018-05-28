package com.project.proto.command.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.junit.internal.matchers.SubstringMatcher;
import org.springframework.ui.Model;

import com.project.proto.dao.Dao;
import com.project.proto.dto.Dto;

public class registerProc implements Command {

	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int tmp;
		String tmp2;
		System.out.println(req.getParameter("employeeNumber"));
		tmp = Integer.parseInt(req.getParameter("employeeNumber").substring(6, 7));
		
		switch(tmp){
			case 1 : tmp2 = "경영지원"; break;
			case 2 : tmp2 = "인사팀"; break;
			case 3 : tmp2 = "개발팀"; break;
			case 4 : tmp2 = "영업팀"; break;
			default : tmp2 = "손님";
		}
		
		
		int employeeNumber =  Integer.parseInt(req.getParameter("employeeNumber"));
		String name =  req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Dto dto = new Dto();
		
		dto.setEmployeeNumber(employeeNumber);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPassword(password);
		dto.setTeamNum(tmp);
		dto.setTeam(tmp2);
		
		dao.register(dto);
	   
	}
}
