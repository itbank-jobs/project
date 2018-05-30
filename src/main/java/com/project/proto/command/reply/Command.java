package com.project.proto.command.reply;

import org.springframework.ui.Model;

import com.project.proto.dao.Reply_Dao;

public interface Command {

	public void execute(Model model,Reply_Dao dao);
}