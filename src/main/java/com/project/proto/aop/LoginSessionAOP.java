package com.project.proto.aop;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class LoginSessionAOP {

//	@Before("within(com.project.proto.MainController)")
	public void LoginSessionCheck(JoinPoint JoinPoint) {

		HttpServletResponse response = null;
		HttpSession session = null;
		// String method = JoinPoint.getSignature().getName(); joinpoint method
		// 확인
		for (Object obj : JoinPoint.getArgs()) {
			if (obj instanceof HttpServletResponse) {
				response = (HttpServletResponse) obj;
			} else if (obj instanceof HttpSession) {
				session = (HttpSession) obj;
			}
		}
		if (session.getAttribute("employeeNumber") == null) {
			try {
				response.sendRedirect("/proto");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
