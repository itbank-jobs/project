package com.project.proto.command.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.proto.dao.Dao;
import com.project.proto.dto.Chat_Dto;
import com.project.proto.dto.Dto;

public class loginCheck implements Command {

	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub
	
		Map<String, Object>map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		HttpSession session = (HttpSession) map.get("session");
		List<Dto> list;
		int chk = 1;
		Dto dto = new Dto();
		try {
		
			PrintWriter out = res.getWriter();
		
			
			String employeeNumber = (req.getParameter("employeeNumber")==null) ? "" : req.getParameter("employeeNumber");
			String password = (req.getParameter("password")==null) ? "" : req.getParameter("password");
		
			dto.setEmployeeNumber(Integer.parseInt(employeeNumber));
			dto.setPassword(password);
			
			list = dao.loginCheck(dto);
			chk = list.size();
	
			System.out.println("employeeNumber : "+ employeeNumber );
			System.out.println("password : "+ password);
			System.out.println("CHK : " + chk);
		
			if(chk >0) {

				dto.setName(list.get(0).getName());
				session.setAttribute("employeeNumber",dto.getEmployeeNumber());
				session.setAttribute("name",dto.getName());
				session.setAttribute("lCAL", new ArrayList<Chat_Dto>());
				session.setAttribute("chatListStyle","display:none;");
				session.setAttribute("chatControllerHide",true);			

			}
			else {
				System.out.println("커멘드 : 로그인 실패");
				
			}
		
			
			out.print(chk);//=result
			out.flush();
			out.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	
	

		
	}

}
