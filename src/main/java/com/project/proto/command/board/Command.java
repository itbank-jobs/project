package com.project.proto.command.board;
import org.springframework.ui.Model;

import com.project.proto.dao.Board_Dao;

public interface Command {

	public void execute(Model model, Board_Dao dao);
}