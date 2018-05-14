package com.project.proto;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.proto.command.board.Command;
import com.project.proto.command.board.ListCommand;
import com.project.proto.dao.board_Dao;

@Controller
public class testController {

Command comm;
	
	@Autowired
	board_Dao dao;
	

}
