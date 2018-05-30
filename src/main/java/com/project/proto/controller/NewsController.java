package com.project.proto.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.proto.chat.EchoHandler;
import com.project.proto.command.login.Command;
import com.project.proto.command.news.News_passCK;
import com.project.proto.command.news.News_write;
import com.project.proto.dao.Dao;
import com.project.proto.dao.Notice_Dao;
import com.project.proto.dto.Notice_Dto;

@Controller
public class NewsController {

	Command comm;

	@Autowired
	Dao dao;

	@Autowired
	Notice_Dao ndao;

	@Autowired
	EchoHandler echoHandler;

	// 공지사항 비밀번호 체크
	@RequestMapping("/news_passCK")
	public void loginCheck(Model model, HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("news_passCK()실행");

		model.addAttribute("req", req);
		model.addAttribute("res", res);

		comm = new News_passCK();
		comm.execute(model, dao);

	}

	@RequestMapping("/news_writeView")
	public String news_writeView(Model model, HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("news_writeView()실행");

		return "news/news_writeView";
	}

	@RequestMapping("/news_write")
	public void news_write(Model model, HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws UnsupportedEncodingException {
		System.out.println("news_write()실행");
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req", req);
		model.addAttribute("res", res);

		comm = new News_write();
		comm.execute(model, dao);

	}

	@RequestMapping("/newsData")
	public void newsData(Model model, HttpSession session, HttpServletResponse res, HttpServletRequest req)
			throws IOException {
		System.out.println("newsData()실행");
		
		int num = Integer.parseInt(req.getParameter("currentPageNum"));

		List<Notice_Dto> list = ndao.list(num);

		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		if (num > 5) {
			for (int i = 0; i < 5; i++) {
				out.println("<li class='content' onclick='conCk(this)'><a href='" + list.get(i).getLink() + "' target='_blank'>"
						+ list.get(i).getTitle() + "</a><br><i>" + list.get(i).getAuthor() + "</i><div>"
						+ list.get(i).getContent() + "</div></li>");
								
				
			}
		} else {
			for (int i = 0; i < num ; i++) {
				out.println("<li class='content' onclick='conCk(this)'><a href='" + list.get(i).getLink() + "' target='_blank'>"
						+ list.get(i).getTitle() + "</a><br><i>" + list.get(i).getAuthor() + "</i><div>"
						+ list.get(i).getContent() + "</div></li>");
			
				
			}

			out.flush();
			out.close();

		}
	}

}
