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
		String notation = req.getParameter("notation");
		String playdate = req.getParameter("playdate");
		
		System.out.println("nickname : "+nickname);
		System.out.println("notation : "+notation);
		System.out.println("playdate : "+playdate);
		
		cdto.setNickname(nickname);
		cdto.setNotation(notation);
		cdto.setPlaydate(playdate);
		
		cdao.saveNotation(cdto);
		
		System.out.println("SaveNotationCommand : execute method로 dto에 저장 완료.");
	}
}