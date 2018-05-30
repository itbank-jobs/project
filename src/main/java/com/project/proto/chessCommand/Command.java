package com.project.proto.chessCommand;

import org.springframework.ui.Model;
import com.project.proto.chessdb.ChessDao;

public interface Command {

	public void execute(Model model, ChessDao cdao);
}