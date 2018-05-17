package com.project.proto;



import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.dao.Dao;

@Controller
public class CalendarController {

	@Autowired
	Dao dao;
	
	@RequestMapping(value="/calendar")
	public String calendar(Model model,HttpServletRequest request) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		int TotalDay;
		System.out.println(cal.get(Calendar.YEAR));
		System.out.println(cal.get(Calendar.MONTH)+1);
		System.out.println(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		System.out.println(cal.get(Calendar.DAY_OF_WEEK));
			model.addAttribute("year",cal.get(Calendar.YEAR));
			model.addAttribute("month",cal.get(Calendar.MONTH)+1);
			model.addAttribute("calDM",cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			model.addAttribute("calDW",cal.get(Calendar.DAY_OF_WEEK)-1);
			cal.set(Calendar.MONTH,Calendar.MONTH+1);
			model.addAttribute("lastCalDM",cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		return "calendar/calendar";
	}
	
	@RequestMapping(value="/calendarAjax")
	public String calendarAjax(Model model,HttpServletRequest request) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		int TotalDay;
		if(request.getParameter("year") != null){
			cal.set(Calendar.YEAR, Integer.parseInt( request.getParameter("year")));
		}
		if(request.getParameter("month") != null){
			cal.set(Calendar.MONTH, Integer.parseInt( request.getParameter("month"))-1);	
		}
		System.out.println(cal.get(Calendar.YEAR));
		System.out.println(cal.get(Calendar.MONTH)+1);
		System.out.println(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		System.out.println(cal.get(Calendar.DAY_OF_WEEK));
			model.addAttribute("year",cal.get(Calendar.YEAR));
			model.addAttribute("month",cal.get(Calendar.MONTH)+1);
			model.addAttribute("calDM",cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			model.addAttribute("calDW",cal.get(Calendar.DAY_OF_WEEK)-1);
			cal.set(Calendar.MONTH,Calendar.MONTH+1);
			model.addAttribute("lastCalDM",cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		return "calendar/calendarAjax";
	}
}
