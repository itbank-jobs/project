package com.project.proto.command;
import org.springframework.ui.Model;

import com.project.proto.dao.Dao;

public interface Command {

	public void execute(Model model,Dao dao);
}