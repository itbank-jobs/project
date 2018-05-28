package com.project.proto;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.dao.Dao;
import com.project.proto.dto.ChatComment_Dto;
import com.project.proto.dto.Chat_Dto;
@Controller
public class ChatController {

	@Autowired
	Dao dao;
	
	@RequestMapping("/chattingData")
	public void chattingData(Model model,HttpSession session,HttpServletRequest req,HttpServletResponse res) throws IOException{
		ChatComment_Dto dto = new ChatComment_Dto();
		dto.setE_from(req.getParameter("e_from"));
		dto.setE_to(req.getParameter("e_to"));
		dto.setChat_comment(req.getParameter("chat_comment"));
		dao.insertChatList(dto);
	}
	
	@RequestMapping("/chatListStyle")
	public void chatListHide(Model model,HttpSession session,HttpServletRequest req,HttpServletResponse res) throws IOException{
		session.setAttribute("chatListStyle",req.getParameter("style"));
	}
	
	@RequestMapping("/chatControllerHide")
	public void chatControllerHide(Model model,HttpSession session,HttpServletRequest req,HttpServletResponse res) throws IOException{
		session.setAttribute("chatControllerHide",!(boolean)session.getAttribute("chatControllerHide"));

	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/chatCheckStyle")
	public void chatCheckPosition(Model model,HttpSession session,HttpServletRequest req,HttpServletResponse res) throws IOException{
			ArrayList<Chat_Dto> lCAL = (ArrayList<Chat_Dto>) session.getAttribute("lCAL");
			boolean check = false;
			
			for(int i = 0; i<lCAL.size();i++) {
				if(req.getParameter("employeeNumber").equals(lCAL.get(i).getEmployeeNumber()+"")) {
					lCAL.get(i).setStyle(req.getParameter("style"));
					check = true;
				}
			}
			if(!check) {
				Chat_Dto dto = new Chat_Dto();
				dto.setEmployeeNumber(Integer.parseInt(req.getParameter("employeeNumber")));
				dto.setStyle(req.getParameter("style"));
				lCAL.add(dto);
			}
			System.out.println(req.getParameter("employeeNumber")+":"+req.getParameter("style"));
	}
}
