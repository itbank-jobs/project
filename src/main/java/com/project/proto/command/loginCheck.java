package com.project.proto.command;

import java.io.IOException;
import java.io.PrintWriter;
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
		int chk = 0;
		Dto dto = new Dto();
		
		try {
			PrintWriter out = res.getWriter();
			
			
			String email = (req.getParameter("email")==null) ? "" : req.getParameter("email");
			String password = (req.getParameter("password")==null) ? "" : req.getParameter("password");
			dto.setEmail(email);
			dto.setPassword(password);
			
			chk = dao.loginCheck(dto);
			
			System.out.println("email : "+ email );
			System.out.println("password : "+ password);
			System.out.println("CHK : " + chk);
			out.print(chk);//=result
			out.flush();
			out.close();
			
		
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	
	
		
		
		
/*		if(chk >0) {
			System.out.println("커멘드 : 로그인성공");
			session.setAttribute("email",dto.getEmail());
			session.setAttribute("password", dto.getEmail());
			try {
				res.sendRedirect("main");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			System.out.println("커멘드 : 로그인 실패");
				try {
					res.sendRedirect("/proto");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}*/
		
		
	}

}
