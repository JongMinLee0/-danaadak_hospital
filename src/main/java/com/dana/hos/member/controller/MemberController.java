package com.dana.hos.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/login/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, Model model) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referer);

		return "member/login/loginForm";
	} 
	
	@RequestMapping(value = "/login/accessDenied", method = RequestMethod.GET)
	public String accessDenied(Model model) {
		return "member/login/accessDenied";
	}
	
	@RequestMapping(value = "/join/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		return "member/join/joinForm";
	}

	@RequestMapping(value = "/join/joinForm", method = RequestMethod.POST)
	public String join(Model model) {
		return "member/join/joinForm";
	}
}
