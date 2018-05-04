package com.project.proto.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;


@Aspect
public class LoginSessionAOP {

	@After("within(com.project.proto.MainController")
	public void LoginSessionCheck(HttpSession session){
		
		String logCheck=(String) session.getAttribute("employeeNumber");
		
		if(logCheck == null) {
			//로그인 페이지로 이동 
		}
		
	}
	
}
