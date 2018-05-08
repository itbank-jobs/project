package com.project.proto.aop;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.IOException;
import java.util.Enumeration;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Aspect
public class LoginSessionAOP {

	@Before("within(com.project.proto.MainController)")
	public Object LoginSessionCheck(JoinPoint JoinPoint) {
		System.out.println();
		System.out.println("-----------Before 영역--------------");

		HttpServletRequest request = null;
		HttpServletResponse response = null;
		Model model = null;
		HttpSession session = null;
		String method = JoinPoint.getSignature().getName();

		for (Object obj : JoinPoint.getArgs()) {
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			} else if (obj instanceof Model) {
				model = (Model) obj;
			} else if (obj instanceof HttpServletResponse) {
				response = (HttpServletResponse) obj;
			} else if (obj instanceof HttpSession) {
				session = (HttpSession) obj;
			}
		}
		System.out.println("method : " + method);
		System.out.println("response : " + response);
		System.out.println("request : " + request);
		if (request != null) {
			Enumeration e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String name = e.nextElement().toString();

				System.out.println("key:" + name + "//" + request.getParameter(name));
			}
		}
		System.out.println("model : " + model);
		System.out.println("session : " + session);
		if (session != null) {
			Enumeration e = session.getAttributeNames();
			while (e.hasMoreElements()) {
				String name = e.nextElement().toString();

				System.out.println("key:" + name + "//" + session.getAttribute(name));
			}
		}
		System.out.println("-----------Before 영역--------------");
		System.out.println();
		
		
		System.out.println("-----------Before 영역 [TEST]--------------");
		
	
		if( session == null){
			System.out.println("----------- [Login1]--------------");
			return "login";
		}
	
		
		System.out.println("----------- [method] --------------");
		return '"'+method+'"';
		
		
	}
}

/*	@AfterReturning("within(com.project.proto.*)")
	public void LoginSessionCheck2(JoinPoint JoinPoint) {
		System.out.println();
		System.out.println("-----------After<noneError>영역--------------");

		HttpServletRequest request = null;
		HttpServletResponse response = null;
		Model model = null;
		HttpSession session = null;
		String method = JoinPoint.getSignature().getName();

		for (Object obj : JoinPoint.getArgs()) {
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			} else if (obj instanceof Model) {
				model = (Model) obj;
			} else if (obj instanceof HttpServletResponse) {
				response = (HttpServletResponse) obj;
			} else if (obj instanceof HttpSession) {
				session = (HttpSession) obj;
			}
		}
		System.out.println("method : " + method);
		System.out.println("response : " + response);
		System.out.println("req : " + request);
		if (request != null) {
			Enumeration e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String name = e.nextElement().toString();

				System.out.println("key:" + name + "//" + request.getParameter(name));
			}
		}

		System.out.println("model : " + model);
		System.out.println("session : " + session);
		if (session != null) {
			Enumeration e = session.getAttributeNames();
			while (e.hasMoreElements()) {
				String name = e.nextElement().toString();

				System.out.println("key:" + name + "//" + session.getAttribute(name));
			}
		}
		System.out.println("-----------After<noneError>영역--------------");
		System.out.println();

	}

	@AfterThrowing("within(com.project.proto.*)")
	public void LoginSessionCheck3(JoinPoint JoinPoint) {
		System.out.println();
		System.out.println("-----------After<Error>영역--------------");
		
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		Model model = null;
		HttpSession session = null;
		String method = JoinPoint.getSignature().getName();

		for (Object obj : JoinPoint.getArgs()) {
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			} else if (obj instanceof Model) {
				model = (Model) obj;
			} else if (obj instanceof HttpServletResponse) {
				response = (HttpServletResponse) obj;
			} else if (obj instanceof HttpSession) {
				session = (HttpSession) obj;
			}
		}
		System.out.println("method : " + method);
		System.out.println("response : " + response);
		System.out.println("req : " + request);
		if (request != null) {
			Enumeration e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String name = e.nextElement().toString();

				System.out.println("key:" + name + "//" + request.getParameter(name));
			}
		}

		System.out.println("model : " + model);
		System.out.println("session : " + session);
		if (session != null) {
			Enumeration e = session.getAttributeNames();
			while (e.hasMoreElements()) {
				String name = e.nextElement().toString();

				System.out.println("key:" + name + "//" + session.getAttribute(name));
			}
		}
		System.out.println("-----------After<Error>영역--------------");
		System.out.println();

	}

}*/