package com.project.proto.chessCommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.proto.chessdb.ChessDto;
import com.project.proto.chessdb.ChessDao;

public class SaveNotationCommand implements Command {
	
	@Override
	public void execute(Model model, ChessDao cdao) {
		
		ChessDto cdto = new ChessDto();
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String nickname = req.getParameter("nickname");
		String color = req.getParameter("color");
		String piece = req.getParameter("piece");
		String beforeranks = req.getParameter("beforeranks");
		String beforefiles = req.getParameter("beforefiles");
		String afterranks = req.getParameter("afterranks");
		String afterfiles = req.getParameter("afterfiles");
		
		System.out.println("nickname : "+nickname);
		System.out.println("color : "+color);
		System.out.println("piece : "+piece);
		System.out.println("beforeranks : "+beforeranks);
		System.out.println("beforefiles : " +beforefiles);
		System.out.println("afterranks : "+afterranks);
		System.out.println("afterfiles : "+afterfiles);
	
		
		
		cdto.setNickname(nickname);
		cdto.setColor(color);
		cdto.setPiece(piece);
		cdto.setBeforeranks(beforeranks);
		cdto.setBeforefiles(beforefiles);
		cdto.setAfterranks(afterranks);
		cdto.setAfterfiles(afterfiles);
		
		
		cdao.saveNotation(cdto);
		
		System.out.println("SaveNotationCommand : execute method로 dto에 저장 완료.");
	}
}