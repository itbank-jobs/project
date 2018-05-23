package com.project.proto.aop;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class LoginSessionAOP {

	@Before("within(com.project.proto.controller.*)")
	public void LoginSessionCheck(JoinPoint JoinPoint) {
		
		HttpServletRequest req = null;
		HttpServletResponse res = null;
		HttpSession session = null;
		// String method = JoinPoint.getSignature().getName(); joinpoint method
		// 확인

		for (Object obj : JoinPoint.getArgs()) {
			if (obj instanceof HttpServletResponse) {
				res = (HttpServletResponse) obj;
			} else if (obj instanceof HttpSession) {
				session = (HttpSession) obj;
			}else if (obj instanceof HttpServletRequest) {
				req = (HttpServletRequest) obj;
			}
		}
	/*	System.out.println("AOP[Before] 요청 페이지 = : " + req.getRequestURI());*/
		if (session.getAttribute("employeeNumber") == null) {
			if(req.getRequestURI().equals("/proto/")||req.getRequestURI().equals("/proto/register")){
				System.out.println("req.getRequestURI() == : " + req.getRequestURI());
			}
			else {
				System.out.println("req.getRequestURI() != : " + req.getRequestURI());
			
			try {
				res.sendRedirect("/proto");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			}
		}
		
		
	}
}
