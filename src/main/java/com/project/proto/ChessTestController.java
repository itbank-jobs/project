package com.project.proto;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChessTestController {
	@RequestMapping(value = "/chessTest")
	public String chess() {

		return "chessTest/chessTest4";
	}
}
