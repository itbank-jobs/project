package com.project.proto.chessCommand;

import java.util.List;

import org.springframework.ui.Model;

import com.project.proto.chessdb.ChessDao;
import com.project.proto.chessdb.ChessDto;

public class NotationViewCommand implements Command {

	public void execute(Model model, ChessDao cdao) {
		List<ChessDto> list = cdao.NotationView();
		model.addAttribute("NotationView", list);
		System.out.println("NotationViewCommand : execute method 동작중.");
	}
	
}
