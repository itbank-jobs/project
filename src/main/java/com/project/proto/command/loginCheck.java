package com.project.proto.command;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.proto.dao.Dao;
import com.project.proto.dto.Dto;

public class loginCheck implements Command {

	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub

		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		HttpSession session = (HttpSession) map.get("session");
		
		
		Dto dto = new Dto();
		dto.setEmail(req.getParameter("email"));
		dto.setPassword(req.getParameter("password"));
		int chk = dao.loginCheck(dto);
		
		if(chk >0) {
			System.out.println("커멘드 : 로그인성공");
			/*session.setAttribute("email",dto.getEmail());
			session.setAttribute("password", dto.getEmail());*/
			try {
				res.sendRedirect("main");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
