package com.dana.hos.comm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dana.hos.comm.service.SmartPhotoService;

@Controller
@RequestMapping("/comm/")
public class CommuController {
	
	@Autowired
	SmartPhotoService smartPhotoService;
	
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
	
	// 후기 작성페이지로 이동
	@RequestMapping("reviewWrite")
	public String reviewWriteForm() {
		return "write";
	}
	
	// 스마트에디터 파일 첨부
	@RequestMapping(value="smartPhoto", method= RequestMethod.POST)
	public void multiSmartPhoto(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("smartPhoto 들어옴");
		smartPhotoService.smartUpload(request, response);
	}
}
