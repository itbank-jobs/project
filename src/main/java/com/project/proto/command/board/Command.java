package com.project.proto.command.board;
import org.springframework.ui.Model;

import com.project.proto.dao.board_Dao;

public interface Command {

	public void execute(Model model, board_Dao dao);
}