package com.project.proto.aop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.project.proto.chat.EchoHandler;
import com.project.proto.dao.Dao;
import com.project.proto.dto.ChatComment_Dto;
import com.project.proto.dto.Chat_Dto;


@Aspect
public class LoginSessionAOP {
	
	@Autowired
	EchoHandler echoHandler;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	HttpServletResponse res;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	Dao dao;
		
	
	@Before("within(com.project.proto.controller.*)")
	public void LoginSessionCheck(JoinPoint JoinPoint) {	
		// String method = JoinPoint.getSignature().getName(); joinpoint method
		// 확인
		Model model = null;
		
		System.out.println("AOP[Before] 요청 페이지 = : " + req.getRequestURI());
		if (session.getAttribute("employeeNumber") == null) {
				System.out.println("req.getRequestURI() != : " + req.getRequestURI());
			try {
				res.sendRedirect("/proto");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			for(Object obj: JoinPoint.getArgs()) {
				if(obj instanceof Model) {
					model = (Model) obj;
				}
			}
			model.addAttribute("chatList", dao.chatList());
			List<Chat_Dto> list = new ArrayList<Chat_Dto>();
			List<String> liveList = new ArrayList<String>();
			ChatComment_Dto cdto = new ChatComment_Dto();
			@SuppressWarnings("unchecked")
			ArrayList<Chat_Dto> lCAL = (ArrayList<Chat_Dto>) session.getAttribute("lCAL");
			for(int i = 0; i<echoHandler.getList().size(); i ++) {
				Chat_Dto dto = new Chat_Dto();
				dto.setName((String)echoHandler.getList().get(i).getAttributes().get("name"));
				dto.setEmployeeNumber(Integer.parseInt((String)echoHandler.getList().get(i).getAttributes().get("employeeNumber")));
				for(int j = 0; j<lCAL.size();j++) {
					if((lCAL.get(j).getEmployeeNumber()+"").equals((String)echoHandler.getList().get(i).getAttributes().get("employeeNumber"))) {
						dto.setStyle(lCAL.get(j).getStyle());
					}
				}
				cdto.setE_from(""+session.getAttribute("employeeNumber"));
				cdto.setE_to((String)echoHandler.getList().get(i).getAttributes().get("employeeNumber"));
				System.out.println(cdto.getE_from());
				System.out.println(cdto.getE_to());
				dto.setCommentList(dao.selectChatList(cdto));
				
				liveList.add((String)echoHandler.getList().get(i).getAttributes().get("employeeNumber"));
				list.add(dto);				
			}
			
					
			
			
			model.addAttribute("chatListLive",list);
			model.addAttribute("liveList",liveList);
		}
		
		
	}
}
