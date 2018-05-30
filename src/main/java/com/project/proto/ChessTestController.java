package com.project.proto;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChessTestController {
	@RequestMapping(value = "/chessTest")
	public String chess() {

		return "chessTest/chessTest4";
	}
	@RequestMapping(value = "/chessReview")
	public String chessReview() {

		return "chessTest/chessReview";
	}
	@RequestMapping(value = "/chessReviewResult")
	public String chessReviewResult() {

		return "chessTest/chessReviewResult";
	}
}
