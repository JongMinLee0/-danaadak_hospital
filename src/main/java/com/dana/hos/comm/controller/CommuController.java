package com.dana.hos.comm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comm/")
public class CommuController {
	
	// 커뮤니티 메인 페이지
	@RequestMapping("main")
	public String commMain() {
		return "commu/commain";
	}
	
	// 이벤트 페이지
	@RequestMapping("event")
	public String comEvent() {
		return "event";
	}
	
	// 후기 페이지
	@RequestMapping("review")
	public String comReview() {
		return "review";
	}
	
	// 채팅 페이지
	@RequestMapping("chat")
	public String comChat() {
		return "chat";
	}
}
