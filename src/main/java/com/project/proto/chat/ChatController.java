package com.project.proto.chat;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping(value="/chat")
	public String chat(Model model,HttpSession session) {
		
		model.addAttribute("userSession",session.getId());
		return "chatTest/chatTest";
	}
}
