package com.dana.hos.member.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberservice;
	
	@RequestMapping(value = "/login/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, Model model) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referer);

		return "member/login/loginForm";
	} 
	
	@RequestMapping(value = "/login/accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		return "member/login/accessDenied";
	}
	
	@RequestMapping(value = "/join/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join/joinForm";
	}

	@RequestMapping(value = "/join/join", method = RequestMethod.POST)
	public String join(MemberDTO dto, ModelAndView mav) {
		dto.setAddress(dto.getAddress().replaceAll(",", " "));
		dto.setBirth(dto.getBirth().replaceAll(",", ""));
		System.out.println(dto.getBirth());
		memberservice.joinProcess(dto);
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/join/phone", method = RequestMethod.GET)
	public String phone(Model model) {
		return "member/join/phone";
	}
}
