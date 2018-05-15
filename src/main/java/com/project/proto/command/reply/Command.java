package com.project.proto.command.reply;

import org.springframework.ui.Model;

import com.project.proto.dao.reply_Dao;

public interface Command {

	public void execute(Model model,reply_Dao dao);
}