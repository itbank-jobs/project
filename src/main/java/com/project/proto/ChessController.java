package com.project.proto;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChessController {

	@RequestMapping(value = "/chess")
	public String chess() {
		
		
		return "chessTest/chess";
	}
}
